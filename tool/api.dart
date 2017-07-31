import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'package:http/http.dart' as http;
import 'package:indenting_buffer/indenting_buffer.dart';
import 'package:recase/recase.dart';
import 'package:string_scanner/string_scanner.dart';

final RegExp _list = new RegExp(r'List<([^>]+)>');
final RegExp _method = new RegExp(r"\* method: '([^']+)'");
final RegExp _paramsVoid = new RegExp(r"params: void");
final RegExp _paramsBacktick = new RegExp(r"params:([^`\n\r])*`([^`]+)`");
final RegExp _responseVoid = new RegExp(r"(response|result): void");
final RegExp _responseBacktick =
    new RegExp(r"(response|result):([^`\n\r])*`([^`]+)`");

/// Auto-generates the server/client classes for the Language Server Protocol.
main() async {
  var client = new http.Client();
  var url =
      'https://raw.githubusercontent.com/Microsoft/language-server-protocol/master/protocol.md';
  print('Visiting $url...');
  var response = await client.get(url).timeout(const Duration(seconds: 10));
  client.close();

  List<ApiInfo> apis = [];
  var api = new ApiInfo();
  var scanner = new StringScanner(response.body);
  var mode = ScannerMode.general;
  var b = new StringBuffer();

  while (!scanner.isDone) {
    if (mode == ScannerMode.general) {
      if (scanner.scan('_Request_:')) {
        api = new ApiInfo()..type = ApiInfoType.endpoint;
        mode = ScannerMode.seekMethod;
      } else if (scanner.scan('_Notification_:')) {
        api = new ApiInfo()..type = ApiInfoType.notification;
        mode = ScannerMode.seekMethod;
      } else
        scanner.readChar();
    } else if (mode == ScannerMode.seekMethod) {
      if (scanner.scan(_method)) {
        api.method = scanner.lastMatch[1];
        mode = ScannerMode.seekParams;
      } else
        scanner.readChar();
    } else if (mode == ScannerMode.seekParams) {
      bool set = false;

      if (scanner.scan(_paramsVoid) ||
          scanner.matches('_Request_') ||
          scanner.matches('_Notification_')) {
        api.requestType = null;
        set = true;
      } else if (scanner.scan(_paramsBacktick)) {
        //print('Backtick: ${scanner.lastMatch[0]} => ${scanner.lastMatch[2]}');
        api.requestType = scanner.lastMatch[2];
        set = true;
      }

      if (set) {
        if (api.type == ApiInfoType.notification) {
          apis.add(api);
          api = null;
          mode = ScannerMode.general;
        } else {
          //print('Seek response for ${api.method}');
          mode = ScannerMode.seekResponse;
        }
      } else
        scanner.readChar();
    } else if (mode == ScannerMode.seekResponse) {
      bool set = false;

      if (scanner.scan(_responseVoid)) {
        api.responseType = null;
        set = true;
      } else if (scanner.scan(_responseBacktick)) {
        api.responseType = scanner.lastMatch[3];
        set = true;
      }

      if (set) {
        b.clear();
        apis.add(api);
        api = null;
        mode = ScannerMode.general;
      } else {
        var ch = scanner.readChar();
        b.writeCharCode(ch);
      }
    } else
      scanner.readChar();
  }

  print('Extracted ${apis.length} endpoint(s)');

  // Transform array types into lists
  for (var api in apis) {
    if (api.requestType != null &&
        api.requestType.length > 2 &&
        api.requestType.endsWith('[]'))
      api.requestType = 'List<' +
          api.requestType.substring(0, api.requestType.length - 2) +
          '>';
    if (api.responseType != null &&
        api.responseType.length > 2 &&
        api.responseType.endsWith('[]'))
      api.responseType = 'List<' +
          api.responseType.substring(0, api.responseType.length - 2) +
          '>';

    // Handle unions
    if (api.requestType?.contains('|') == true) api.requestType = null;
    if (api.responseType?.contains('|') == true) api.responseType = null;
  }

  for (var api in apis) {
    print(api.method);
    print('  type: ' +
        (api.type == ApiInfoType.notification ? 'notification' : 'api'));
    print('  Input: ' + (api.requestType ?? '(none)'));
    print('  Output: ' + (api.responseType ?? 'void'));
    print('\n');
  }
  // Now, generate APIs!!!
  var clientBuf = new IndentingBuffer(),
      serverBuf = new IndentingBuffer(),
      configureBuf = new IndentingBuffer();

  clientBuf
    ..writeln("import 'dart:async';")
    ..writeln("import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;")
    ..writeln("import 'interfaces/interfaces.dart';")
    ..writeln('/// Asynchronously interacts with an LSP server.')
    ..writeln('class Client {')
    ..indent()
    ..writeln('final json_rpc.Client rpcClient;')
    ..writeln()
    ..writeln('Client(this.rpcClient);');

  serverBuf
    ..writeln("import 'dart:async';")
    ..writeln("import 'package:meta/meta.dart';")
    ..writeln("import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;")
    ..writeln("import 'package:stream_channel/stream_channel.dart';")
    ..writeln("import 'interfaces/interfaces.dart';")
    ..writeln('/// A base class for implementing LSP servers.')
    ..writeln('class Server {')
    ..indent()
    ..writeln('@mustCallSuper')
    ..writeln('json_rpc.Server listen(StreamChannel<String> channel) {')
    ..indent()
    ..writeln('var server = new json_rpc.Server(channel);')
    ..writeln('_configure(server);')
    ..writeln('server.listen();')
    ..writeln('return server;')
    ..outdent()
    ..writeln('}');

  configureBuf
    ..writeln('void _configure(json_rpc.Server server) {')
    ..indent();

  for (var api in apis) {
    var snake = api.method.split('/').where((s) => s != r'$').join('_');
    var methodName = new ReCase(snake).camelCase;

    if (api.type == ApiInfoType.notification) {
      // Generate only client for notifications
      ReCase rc;
      clientBuf.writeln('/// Send a `${api.method}` notification.');
      clientBuf.write('void $methodName(');

      if (api.requestType != null) {
        rc = new ReCase(api.requestType);
        clientBuf.withoutIndent('${api.requestType} ${rc.camelCase}');
      }

      clientBuf
        ..withoutIndent(') {\n')
        ..indent();
      clientBuf.write("rpcClient.sendNotification(r'${api.method}'");
      if (rc != null) clientBuf.withoutIndent(', ${rc.camelCase}.toJson()');
      clientBuf.withoutIndent(');');
      clientBuf
        ..outdent()
        ..writeln('}');
    } else {
      // Generate server-side
      var generic = api.responseType == null ? '' : '<${api.responseType}>';
      serverBuf.writeln('/// Respond to a(n) `${api.method}` request.');
      serverBuf.write('FutureOr$generic $methodName(');

      if (api.requestType != null) {
        var rc = new ReCase(api.requestType);
        serverBuf.withoutIndent('${api.requestType} ${rc.camelCase}');
      }

      serverBuf..withoutIndent(') {\n')..indent();
      serverBuf.writeln("throw new json_rpc.RpcException.methodNotFound(r'${api.method}');");
      serverBuf..outdent()..writeln('}');

      // Add a registerMethod call
      configureBuf
        ..writeln(
            "server.registerMethod('${api.method}', (json_rpc.Parameters params) {")
        ..indent();

      var futureSync =
          new StringBuffer('return new Future.sync(() => $methodName(');

      if (api.requestType != null)
        futureSync.write('${api.requestType}.parse(params.asMap)');

      futureSync.write('))');

      /*
       * return new Future.sync(() => method()).then((result) {
       *  return result.toJson();
       * });
       */

      if (api.responseType != null) {
        futureSync.write('.then((x) => x.toJson())');
      }

      configureBuf
        ..writeln(futureSync.toString() + ';')
        ..outdent()
        ..writeln('});');

      // Generate client-side
      ReCase rc;
      generic = api.responseType == null ? '' : '<${api.responseType}>';
      clientBuf.writeln('/// Send a `${api.method}` request.');
      clientBuf.write('Future$generic $methodName(');

      if (api.requestType != null) {
        rc = new ReCase(api.requestType);
        clientBuf.withoutIndent('${api.requestType} ${rc.camelCase}');
      }

      clientBuf
        ..withoutIndent(') {')
        ..indent();
      clientBuf.write("return rpcClient.sendRequest(r'${api.method}'");
      if (rc != null) clientBuf.withoutIndent(', ${rc.camelCase}.toJson()');
      clientBuf.withoutIndent(')');

      if (api.responseType != null) {
        var m = _list.firstMatch(api.responseType);

        if (m == null)
          clientBuf.withoutIndent(
              '.then<${api.responseType}>(${api.responseType}.parse)');
        else {
          var innerTypeName = m[1];
          clientBuf.withoutIndent(
              '.then<List<$innerTypeName>>((list) => list?.map<$innerTypeName>($innerTypeName.parse)?.toList())');
        }
      }
      clientBuf
        ..withoutIndent(';\n')
        ..outdent()
        ..writeln('}');
    }
  }

  configureBuf
    ..outdent()
    ..writeln('}');
  clientBuf
    ..outdent()
    ..writeln('}');
  serverBuf
    ..outdent()
    ..writeln(configureBuf.toString())
    ..writeln('}');

  var clientFile = new File('lib/src/protocol/client.dart');
  var serverFile = new File('lib/src/protocol/server.dart');
  var m = <File, IndentingBuffer>{clientFile: clientBuf, serverFile: serverBuf};

  for (var k in m.keys) {
    if (!await k.exists()) await k.create(recursive: true);
    await k.writeAsString(new DartFormatter().format(m[k].toString()));
  }
}

class ApiInfo {
  ApiInfoType type;
  String method;
  String requestType, responseType, documentation;
}

enum ApiInfoType { endpoint, notification }

enum ScannerMode {
  general,
  seekMethod,
  seekParams,
  seekResponse,
}

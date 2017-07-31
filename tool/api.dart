import 'dart:io';
import 'package:dart_style/dart_style.dart';
import 'package:http/http.dart' as http;
import 'package:indenting_buffer/indenting_buffer.dart';
import 'package:recase/recase.dart';
import 'package:string_scanner/string_scanner.dart';

final RegExp _method = new RegExp(r"method: '([^']+)'");
final RegExp _paramsVoid = new RegExp(r"params: void");
final RegExp _typeBacktick = new RegExp(r"params:([^`\n\r])*`([^`]+)`");
final RegExp _responseVoid = new RegExp(r"(response|result): void");

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

  while (!scanner.isDone) {
    if (mode == ScannerMode.general) {
      if (scanner.scan('_Request_')) {
        api = new ApiInfo()..type = ApiInfoType.endpoint;
        mode = ScannerMode.seekMethod;
      } else if (scanner.scan('_Notification_')) {
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

      if (scanner.scan(_paramsVoid)) {
        api.requestType = null;
        set = true;
      } else if (scanner.scan(_typeBacktick)) {
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
          mode = ScannerMode.seekResponse;
        }
      } else
        scanner.readChar();
    } else if (mode == ScannerMode.seekResponse) {
      bool set = true;

      if (scanner.scan(_responseVoid)) {
        api.responseType = null;
        set = true;
      }

      if (set) {
        apis.add(api);
        api = null;
        mode = ScannerMode.general;
      } else if (scanner.scan(_typeBacktick)) {
        api.responseType = scanner.lastMatch[2];
        set = true;
      } else
        scanner.readChar();
    } else
      scanner.readChar();
  }

  print('Extracted ${apis.length} endpoint(s)');

  for (var api in apis) {
    print(api.method);
    print('  type: ' +
        (api.type == ApiInfoType.notification ? 'notification' : 'api'));
    print('  Input: ' + (api.requestType ?? '(none)'));
    print('  Input: ' + (api.responseType ?? 'void'));
    print('\n');
  }

  // Now, generate APIs!!!
  var clientBuf = new IndentingBuffer(), serverBuf = new IndentingBuffer();

  clientBuf
    ..writeln("import 'dart:async';")
    ..writeln("import 'interfaces/interfaces.dart';")
    ..writeln('abstract class BaseClient {')
    ..indent();

  serverBuf
    ..writeln("import 'dart:async';")
    ..writeln("import 'interfaces/interfaces.dart';")
    ..writeln('abstract class BaseServer {')
    ..indent();

  for (var api in apis) {
    var snake = api.method.split('/').where((s) => s != r'$').join('_');
    var methodName = new ReCase(snake).camelCase;

    if (api.type == ApiInfoType.notification) {
      // Generate only client for notifications
      clientBuf.write('void $methodName(');

      if (api.requestType != null) {
        var rc = new ReCase(api.requestType);
        clientBuf.withoutIndent('${api.requestType} ${rc.camelCase}');
      }

      clientBuf.withoutIndent(');\n');
    } else {
      // Generate server-side
      var generic = api.responseType == null ? '' : '<${api.responseType}>';
      serverBuf.write('FutureOr$generic $methodName(');

      if (api.requestType != null) {
        var rc = new ReCase(api.requestType);
        serverBuf.withoutIndent('${api.requestType} ${rc.camelCase}');
      }

      serverBuf.withoutIndent(');\n');

      // Generate client-side
      generic = api.responseType == null ? '' : '<${api.responseType}>';
      clientBuf.write('Future$generic $methodName(');

      if (api.requestType != null) {
        var rc = new ReCase(api.requestType);
        clientBuf.withoutIndent('${api.requestType} ${rc.camelCase}');
      }

      clientBuf.withoutIndent(');\n');
    }
  }

  clientBuf
    ..outdent()
    ..writeln('}');
  serverBuf
    ..outdent()
    ..writeln('}');

  var clientFile = new File('lib/src/protocol/client_base.dart');
  var serverFile = new File('lib/src/protocol/server_base.dart');
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

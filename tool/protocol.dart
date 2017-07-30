import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:string_scanner/string_scanner.dart';
import 'package:ts_definition/ts_definition.dart';

/// Auto-generates the protocol definition for the Language Server Protocol.
main() async {
  var client = new http.Client();
  var url = 'https://raw.githubusercontent.com/Microsoft/language-server-protocol/master/protocol.md';
  print('Visiting $url...');
  var response = await client.get(
      url);
  print('Body:\n${response.body}');
  client.close();


  var scanner = new StringScanner(response.body);
  List<String> chunks = [];

  bool insideBacktick = false;
  StringBuffer buf = new StringBuffer();

  while (!scanner.isDone) {
    if (!insideBacktick) {
      if (scanner.scan('```typescript'))
        insideBacktick = true;
      else
        scanner.readChar();
    } else {
      if (scanner.scan('```')) {
        // Hack away some quirks where the TypeScript guys named two things the EXACT same thing!!!
        // Genius!!!
        chunks.add(buf.toString().replaceAll(
            'namespace InitializeError', 'namespace InitializeErrorCode'));
        buf.clear();
        insideBacktick = false;
      } else
        buf.writeCharCode(scanner.readChar());
    }
  }

  if (buf.isNotEmpty) chunks.add(buf.toString());

  var typescriptSource = chunks.join('\n');
  print('Extracted TypeScript:\n$typescriptSource');
  var dartSource = new TsInterfaceToDartTranspiler().generate(typescriptSource);
  print('Generated Dart:\n$dartSource');
  var file = new File('lib/src/protocol/interfaces/interfaces.dart');

  if (!await file.exists()) await file.create(recursive: true);
  await file.writeAsString(
      '/// AUTO-GENERATED: Don\'t even bother modifying.\n\n' + dartSource);
}

import 'dart:async';
import 'dart:isolate';
import 'package:lsp/lsp.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

main() {
  Client client;
  ReceivePort clientPort, serverPort;

  setUp(() {
    serverPort = new ReceivePort();
    clientPort = new ReceivePort();
    new TestServer()
      ..listen(new IsolateChannel(serverPort, clientPort.sendPort));
    client = new Client(new IsolateChannel(clientPort, serverPort.sendPort));
  });

  tearDown(() {
    clientPort.close();
    serverPort.close();
  });

  test('initialize basic', () async {
    var result = await client.initialize(new InitializeParams(processId: 1337));
    print(result);
  });
}

class TestServer extends Server {
  @override
  initialize(InitializeParams params) {
    print(params.processId);
  }
}

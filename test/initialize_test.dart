import 'dart:isolate';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
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
    var rpcClient =
        new json_rpc.Client(new IsolateChannel(clientPort, serverPort.sendPort))
          ..listen();
    client = new Client(rpcClient);
  });

  tearDown(() {
    clientPort.close();
    serverPort.close();
  });

  test('initialize', () async {
    var result = await client.initialize(
      new InitializeParams(
        processId: 1337,
        capabilities: new ClientCapabilities(
          textDocument: new TextDocumentClientCapabilities(
            hover: new TextDocumentClientCapabilitiesHover(
              dynamicRegistration: true,
            ),
          ),
        ),
      ),
    );

    var tdSync = TextDocumentSyncOptions.parse(result.capabilities.textDocumentSync);
    expect(tdSync.save.includeText, isTrue);
    expect(tdSync.willSave, isTrue);
    expect(tdSync.openClose, isFalse);

    expect(result.capabilities.codeLensProvider.resolveProvider, isFalse);
  });
}

class TestServer extends Server {
  @override
  initialize(InitializeParams params) {
    expect(params.processId, 1337);
    expect(params.capabilities.textDocument.hover.dynamicRegistration, isTrue);

    return new InitializeResult(
      capabilities: new ServerCapabilities(
        textDocumentSync: new TextDocumentSyncOptions(
          save: new SaveOptions(
            includeText: true,
          ),
          willSave: true,
          openClose: false,
        ),
        codeLensProvider: new CodeLensOptions(
          resolveProvider: false,
        ),
      ),
    );
  }
}

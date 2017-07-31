import 'dart:async';
import 'package:meta/meta.dart';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
import 'package:stream_channel/stream_channel.dart';
import 'interfaces/interfaces.dart';

/// A base class for implementing LSP servers.
class Server {
  @mustCallSuper
  json_rpc.Server listen(StreamChannel<String> channel) {
    var server = new json_rpc.Server(channel);
    _configure(server);
    server.listen();
    return server;
  }

  /// Respond to a(n) `initialize` request.
  FutureOr<InitializeResult> initialize(InitializeParams initializeParams) {
    throw new json_rpc.RpcException.methodNotFound(r'initialize');
  }

  /// Respond to a(n) `shutdown` request.
  FutureOr<MessageActionItem> shutdown() {
    throw new json_rpc.RpcException.methodNotFound(r'shutdown');
  }

  /// Respond to a(n) `client/registerCapability` request.
  FutureOr clientRegisterCapability(RegistrationParams registrationParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'client/registerCapability');
  }

  /// Respond to a(n) `client/unregisterCapability` request.
  FutureOr<List<TextEdit>> clientUnregisterCapability(
      UnregistrationParams unregistrationParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'client/unregisterCapability');
  }

  /// Respond to a(n) `textDocument/completion` request.
  FutureOr textDocumentCompletion(
      TextDocumentPositionParams textDocumentPositionParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/completion');
  }

  /// Respond to a(n) `completionItem/resolve` request.
  FutureOr<CompletionItem> completionItemResolve(
      CompletionItem completionItem) {
    throw new json_rpc.RpcException.methodNotFound(r'completionItem/resolve');
  }

  /// Respond to a(n) `textDocument/hover` request.
  FutureOr<Hover> textDocumentHover(
      TextDocumentPositionParams textDocumentPositionParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/hover');
  }

  /// Respond to a(n) `textDocument/signatureHelp` request.
  FutureOr<SignatureHelp> textDocumentSignatureHelp(
      TextDocumentPositionParams textDocumentPositionParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'textDocument/signatureHelp');
  }

  /// Respond to a(n) `textDocument/definition` request.
  FutureOr<Location> textDocumentDefinition(
      TextDocumentPositionParams textDocumentPositionParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/definition');
  }

  /// Respond to a(n) `textDocument/references` request.
  FutureOr<Location> textDocumentReferences(ReferenceParams referenceParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/references');
  }

  /// Respond to a(n) `textDocument/documentHighlight` request.
  FutureOr<DocumentHighlight> textDocumentDocumentHighlight(
      TextDocumentPositionParams textDocumentPositionParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'textDocument/documentHighlight');
  }

  /// Respond to a(n) `textDocument/documentSymbol` request.
  FutureOr<SymbolInformation> textDocumentDocumentSymbol(
      DocumentSymbolParams documentSymbolParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'textDocument/documentSymbol');
  }

  /// Respond to a(n) `workspace/symbol` request.
  FutureOr<List<SymbolInformation>> workspaceSymbol(
      WorkspaceSymbolParams workspaceSymbolParams) {
    throw new json_rpc.RpcException.methodNotFound(r'workspace/symbol');
  }

  /// Respond to a(n) `textDocument/codeAction` request.
  FutureOr<List<Command>> textDocumentCodeAction(
      CodeActionParams codeActionParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/codeAction');
  }

  /// Respond to a(n) `textDocument/codeLens` request.
  FutureOr<List<CodeLens>> textDocumentCodeLens(CodeLensParams codeLensParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/codeLens');
  }

  /// Respond to a(n) `codeLens/resolve` request.
  FutureOr<CodeLens> codeLensResolve(CodeLens codeLens) {
    throw new json_rpc.RpcException.methodNotFound(r'codeLens/resolve');
  }

  /// Respond to a(n) `textDocument/documentLink` request.
  FutureOr<DocumentLink> textDocumentDocumentLink(
      DocumentLinkParams documentLinkParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'textDocument/documentLink');
  }

  /// Respond to a(n) `documentLink/resolve` request.
  FutureOr<DocumentLink> documentLinkResolve(DocumentLink documentLink) {
    throw new json_rpc.RpcException.methodNotFound(r'documentLink/resolve');
  }

  /// Respond to a(n) `textDocument/formatting` request.
  FutureOr<List<TextEdit>> textDocumentFormatting(
      DocumentFormattingParams documentFormattingParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/formatting');
  }

  /// Respond to a(n) `textDocument/rangeFormatting` request.
  FutureOr<List<TextEdit>> textDocumentRangeFormatting(
      DocumentRangeFormattingParams documentRangeFormattingParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'textDocument/rangeFormatting');
  }

  /// Respond to a(n) `textDocument/onTypeFormatting` request.
  FutureOr<List<TextEdit>> textDocumentOnTypeFormatting(
      DocumentOnTypeFormattingParams documentOnTypeFormattingParams) {
    throw new json_rpc.RpcException.methodNotFound(
        r'textDocument/onTypeFormatting');
  }

  /// Respond to a(n) `textDocument/rename` request.
  FutureOr<WorkspaceEdit> textDocumentRename(RenameParams renameParams) {
    throw new json_rpc.RpcException.methodNotFound(r'textDocument/rename');
  }

  /// Respond to a(n) `workspace/applyEdit` request.
  FutureOr<ApplyWorkspaceEditResponse> workspaceApplyEdit(
      ApplyWorkspaceEditParams applyWorkspaceEditParams) {
    throw new json_rpc.RpcException.methodNotFound(r'workspace/applyEdit');
  }

  void _configure(json_rpc.Server server) {
    server.registerMethod('initialize', (json_rpc.Parameters params) {
      return new Future.sync(
              () => initialize(InitializeParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('shutdown', (json_rpc.Parameters params) {
      return new Future.sync(() => shutdown()).then((x) => x.toJson());
    });
    server.registerMethod('client/registerCapability',
        (json_rpc.Parameters params) {
      return new Future.sync(() =>
          clientRegisterCapability(RegistrationParams.parse(params.asMap)));
    });
    server.registerMethod('client/unregisterCapability',
        (json_rpc.Parameters params) {
      return new Future.sync(() => clientUnregisterCapability(
          UnregistrationParams.parse(params.asMap))).then((x) => x.toJson());
    });
    server.registerMethod('textDocument/completion',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentCompletion(
          TextDocumentPositionParams.parse(params.asMap)));
    });
    server.registerMethod('completionItem/resolve',
        (json_rpc.Parameters params) {
      return new Future.sync(
              () => completionItemResolve(CompletionItem.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/hover', (json_rpc.Parameters params) {
      return new Future.sync(() =>
              textDocumentHover(TextDocumentPositionParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/signatureHelp',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentSignatureHelp(
              TextDocumentPositionParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/definition',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentDefinition(
              TextDocumentPositionParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/references',
        (json_rpc.Parameters params) {
      return new Future.sync(
              () => textDocumentReferences(ReferenceParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/documentHighlight',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentDocumentHighlight(
              TextDocumentPositionParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/documentSymbol',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentDocumentSymbol(
          DocumentSymbolParams.parse(params.asMap))).then((x) => x.toJson());
    });
    server.registerMethod('workspace/symbol', (json_rpc.Parameters params) {
      return new Future.sync(
              () => workspaceSymbol(WorkspaceSymbolParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/codeAction',
        (json_rpc.Parameters params) {
      return new Future.sync(() =>
              textDocumentCodeAction(CodeActionParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/codeLens',
        (json_rpc.Parameters params) {
      return new Future.sync(
              () => textDocumentCodeLens(CodeLensParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('codeLens/resolve', (json_rpc.Parameters params) {
      return new Future.sync(
              () => codeLensResolve(CodeLens.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/documentLink',
        (json_rpc.Parameters params) {
      return new Future.sync(() =>
              textDocumentDocumentLink(DocumentLinkParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('documentLink/resolve', (json_rpc.Parameters params) {
      return new Future.sync(
              () => documentLinkResolve(DocumentLink.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/formatting',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentFormatting(
              DocumentFormattingParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/rangeFormatting',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentRangeFormatting(
              DocumentRangeFormattingParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/onTypeFormatting',
        (json_rpc.Parameters params) {
      return new Future.sync(() => textDocumentOnTypeFormatting(
              DocumentOnTypeFormattingParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('textDocument/rename', (json_rpc.Parameters params) {
      return new Future.sync(
              () => textDocumentRename(RenameParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
    server.registerMethod('workspace/applyEdit', (json_rpc.Parameters params) {
      return new Future.sync(() =>
              workspaceApplyEdit(ApplyWorkspaceEditParams.parse(params.asMap)))
          .then((x) => x.toJson());
    });
  }
}

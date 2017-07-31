import 'dart:async';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
import 'interfaces/interfaces.dart';

/// Asynchronously interacts with an LSP server.
class Client {
  final json_rpc.Client rpcClient;

  Client(this.rpcClient);

  /// Send a `$/cancelRequest` notification.
  void cancelRequest(CancelParams cancelParams) {
    rpcClient.sendNotification(r'$/cancelRequest', cancelParams.toJson());
  }

  /// Send a `initialize` request.
  Future<InitializeResult> initialize(InitializeParams initializeParams) {
    return rpcClient
        .sendRequest(r'initialize', initializeParams.toJson())
        .then<InitializeResult>(InitializeResult.parse);
  }

  /// Send a `initialized` notification.
  void initialized() {
    rpcClient.sendNotification(r'initialized');
  }

  /// Send a `shutdown` request.
  Future<MessageActionItem> shutdown() {
    return rpcClient
        .sendRequest(r'shutdown')
        .then<MessageActionItem>(MessageActionItem.parse);
  }

  /// Send a `window/logMessage` notification.
  void windowLogMessage(LogMessageParams logMessageParams) {
    rpcClient.sendNotification(r'window/logMessage', logMessageParams.toJson());
  }

  /// Send a `telemetry/event` notification.
  void telemetryEvent() {
    rpcClient.sendNotification(r'telemetry/event');
  }

  /// Send a `client/registerCapability` request.
  Future clientRegisterCapability(RegistrationParams registrationParams) {
    return rpcClient.sendRequest(
        r'client/registerCapability', registrationParams.toJson());
  }

  /// Send a `client/unregisterCapability` request.
  Future<List<TextEdit>> clientUnregisterCapability(
      UnregistrationParams unregistrationParams) {
    return rpcClient
        .sendRequest(
            r'client/unregisterCapability', unregistrationParams.toJson())
        .then<List<TextEdit>>(
            (list) => list?.map<TextEdit>(TextEdit.parse)?.toList());
  }

  /// Send a `textDocument/didClose` notification.
  void textDocumentDidClose(
      DidCloseTextDocumentParams didCloseTextDocumentParams) {
    rpcClient.sendNotification(
        r'textDocument/didClose', didCloseTextDocumentParams.toJson());
  }

  /// Send a `workspace/didChangeWatchedFiles` notification.
  void workspaceDidChangeWatchedFiles(
      DidChangeWatchedFilesParams didChangeWatchedFilesParams) {
    rpcClient.sendNotification(r'workspace/didChangeWatchedFiles',
        didChangeWatchedFilesParams.toJson());
  }

  /// Send a `textDocument/publishDiagnostics` notification.
  void textDocumentPublishDiagnostics(
      PublishDiagnosticsParams publishDiagnosticsParams) {
    rpcClient.sendNotification(
        r'textDocument/publishDiagnostics', publishDiagnosticsParams.toJson());
  }

  /// Send a `textDocument/completion` request.
  Future textDocumentCompletion(
      TextDocumentPositionParams textDocumentPositionParams) {
    return rpcClient.sendRequest(
        r'textDocument/completion', textDocumentPositionParams.toJson());
  }

  /// Send a `completionItem/resolve` request.
  Future<CompletionItem> completionItemResolve(CompletionItem completionItem) {
    return rpcClient
        .sendRequest(r'completionItem/resolve', completionItem.toJson())
        .then<CompletionItem>(CompletionItem.parse);
  }

  /// Send a `textDocument/hover` request.
  Future<Hover> textDocumentHover(
      TextDocumentPositionParams textDocumentPositionParams) {
    return rpcClient
        .sendRequest(r'textDocument/hover', textDocumentPositionParams.toJson())
        .then<Hover>(Hover.parse);
  }

  /// Send a `textDocument/signatureHelp` request.
  Future<SignatureHelp> textDocumentSignatureHelp(
      TextDocumentPositionParams textDocumentPositionParams) {
    return rpcClient
        .sendRequest(
            r'textDocument/signatureHelp', textDocumentPositionParams.toJson())
        .then<SignatureHelp>(SignatureHelp.parse);
  }

  /// Send a `textDocument/definition` request.
  Future<Location> textDocumentDefinition(
      TextDocumentPositionParams textDocumentPositionParams) {
    return rpcClient
        .sendRequest(
            r'textDocument/definition', textDocumentPositionParams.toJson())
        .then<Location>(Location.parse);
  }

  /// Send a `textDocument/references` request.
  Future<Location> textDocumentReferences(ReferenceParams referenceParams) {
    return rpcClient
        .sendRequest(r'textDocument/references', referenceParams.toJson())
        .then<Location>(Location.parse);
  }

  /// Send a `textDocument/documentHighlight` request.
  Future<DocumentHighlight> textDocumentDocumentHighlight(
      TextDocumentPositionParams textDocumentPositionParams) {
    return rpcClient
        .sendRequest(r'textDocument/documentHighlight',
            textDocumentPositionParams.toJson())
        .then<DocumentHighlight>(DocumentHighlight.parse);
  }

  /// Send a `textDocument/documentSymbol` request.
  Future<SymbolInformation> textDocumentDocumentSymbol(
      DocumentSymbolParams documentSymbolParams) {
    return rpcClient
        .sendRequest(
            r'textDocument/documentSymbol', documentSymbolParams.toJson())
        .then<SymbolInformation>(SymbolInformation.parse);
  }

  /// Send a `workspace/symbol` request.
  Future<List<SymbolInformation>> workspaceSymbol(
      WorkspaceSymbolParams workspaceSymbolParams) {
    return rpcClient
        .sendRequest(r'workspace/symbol', workspaceSymbolParams.toJson())
        .then<List<SymbolInformation>>((list) =>
            list?.map<SymbolInformation>(SymbolInformation.parse)?.toList());
  }

  /// Send a `textDocument/codeAction` request.
  Future<List<Command>> textDocumentCodeAction(
      CodeActionParams codeActionParams) {
    return rpcClient
        .sendRequest(r'textDocument/codeAction', codeActionParams.toJson())
        .then<List<Command>>(
            (list) => list?.map<Command>(Command.parse)?.toList());
  }

  /// Send a `textDocument/codeLens` request.
  Future<List<CodeLens>> textDocumentCodeLens(CodeLensParams codeLensParams) {
    return rpcClient
        .sendRequest(r'textDocument/codeLens', codeLensParams.toJson())
        .then<List<CodeLens>>(
            (list) => list?.map<CodeLens>(CodeLens.parse)?.toList());
  }

  /// Send a `codeLens/resolve` request.
  Future<CodeLens> codeLensResolve(CodeLens codeLens) {
    return rpcClient
        .sendRequest(r'codeLens/resolve', codeLens.toJson())
        .then<CodeLens>(CodeLens.parse);
  }

  /// Send a `textDocument/documentLink` request.
  Future<DocumentLink> textDocumentDocumentLink(
      DocumentLinkParams documentLinkParams) {
    return rpcClient
        .sendRequest(r'textDocument/documentLink', documentLinkParams.toJson())
        .then<DocumentLink>(DocumentLink.parse);
  }

  /// Send a `documentLink/resolve` request.
  Future<DocumentLink> documentLinkResolve(DocumentLink documentLink) {
    return rpcClient
        .sendRequest(r'documentLink/resolve', documentLink.toJson())
        .then<DocumentLink>(DocumentLink.parse);
  }

  /// Send a `textDocument/formatting` request.
  Future<List<TextEdit>> textDocumentFormatting(
      DocumentFormattingParams documentFormattingParams) {
    return rpcClient
        .sendRequest(
            r'textDocument/formatting', documentFormattingParams.toJson())
        .then<List<TextEdit>>(
            (list) => list?.map<TextEdit>(TextEdit.parse)?.toList());
  }

  /// Send a `textDocument/rangeFormatting` request.
  Future<List<TextEdit>> textDocumentRangeFormatting(
      DocumentRangeFormattingParams documentRangeFormattingParams) {
    return rpcClient
        .sendRequest(r'textDocument/rangeFormatting',
            documentRangeFormattingParams.toJson())
        .then<List<TextEdit>>(
            (list) => list?.map<TextEdit>(TextEdit.parse)?.toList());
  }

  /// Send a `textDocument/onTypeFormatting` request.
  Future<List<TextEdit>> textDocumentOnTypeFormatting(
      DocumentOnTypeFormattingParams documentOnTypeFormattingParams) {
    return rpcClient
        .sendRequest(r'textDocument/onTypeFormatting',
            documentOnTypeFormattingParams.toJson())
        .then<List<TextEdit>>(
            (list) => list?.map<TextEdit>(TextEdit.parse)?.toList());
  }

  /// Send a `textDocument/rename` request.
  Future<WorkspaceEdit> textDocumentRename(RenameParams renameParams) {
    return rpcClient
        .sendRequest(r'textDocument/rename', renameParams.toJson())
        .then<WorkspaceEdit>(WorkspaceEdit.parse);
  }

  /// Send a `workspace/applyEdit` request.
  Future<ApplyWorkspaceEditResponse> workspaceApplyEdit(
      ApplyWorkspaceEditParams applyWorkspaceEditParams) {
    return rpcClient
        .sendRequest(r'workspace/applyEdit', applyWorkspaceEditParams.toJson())
        .then<ApplyWorkspaceEditResponse>(ApplyWorkspaceEditResponse.parse);
  }
}

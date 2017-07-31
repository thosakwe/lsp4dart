import 'dart:async';
import 'interfaces/interfaces.dart';

abstract class BaseClient {
  void cancelRequest(CancelParams cancelParams);
  Future initialize(InitializeParams initializeParams);
  void initialized();
  Future shutdown();
  void exit();
  void windowShowMessage(ShowMessageParams showMessageParams);
  Future windowShowMessageRequest(
      ShowMessageRequestParams showMessageRequestParams);
  void windowLogMessage(LogMessageParams logMessageParams);
  void telemetryEvent(RegistrationParams registrationParams);
  Future clientUnregisterCapability(UnregistrationParams unregistrationParams);
  void workspaceDidChangeConfiguration(
      DidChangeConfigurationParams didChangeConfigurationParams);
  void textDocumentDidOpen(DidOpenTextDocumentParams didOpenTextDocumentParams);
  void textDocumentDidChange(
      DidChangeTextDocumentParams didChangeTextDocumentParams);
  void textDocumentWillSave(
      WillSaveTextDocumentParams willSaveTextDocumentParams);
  Future textDocumentWillSaveWaitUntil(
      WillSaveTextDocumentParams willSaveTextDocumentParams);
  void textDocumentDidClose(
      DidCloseTextDocumentParams didCloseTextDocumentParams);
  void workspaceDidChangeWatchedFiles(
      DidChangeWatchedFilesParams didChangeWatchedFilesParams);
  void textDocumentPublishDiagnostics(
      PublishDiagnosticsParams publishDiagnosticsParams);
  Future textDocumentCompletion(
      TextDocumentPositionParams textDocumentPositionParams);
  Future completionItemResolve(CompletionItem completionItem);
  Future textDocumentHover(
      TextDocumentPositionParams textDocumentPositionParams);
  Future textDocumentSignatureHelp(
      TextDocumentPositionParams textDocumentPositionParams);
  Future textDocumentDefinition(
      TextDocumentPositionParams textDocumentPositionParams);
  Future textDocumentReferences(ReferenceParams referenceParams);
  Future textDocumentDocumentHighlight(
      TextDocumentPositionParams textDocumentPositionParams);
  Future textDocumentDocumentSymbol(DocumentSymbolParams documentSymbolParams);
  Future workspaceSymbol(WorkspaceSymbolParams workspaceSymbolParams);
  Future textDocumentCodeAction(CodeActionParams codeActionParams);
  Future textDocumentCodeLens(CodeLensParams codeLensParams);
  Future codeLensResolve(CodeLens codeLens);
  Future textDocumentDocumentLink(DocumentLinkParams documentLinkParams);
  Future documentLinkResolve(DocumentLink documentLink);
  Future textDocumentFormatting(
      DocumentFormattingParams documentFormattingParams);
  Future textDocumentRangeFormatting(
      DocumentRangeFormattingParams documentRangeFormattingParams);
  Future textDocumentOnTypeFormatting(
      DocumentOnTypeFormattingParams documentOnTypeFormattingParams);
  Future textDocumentRename(RenameParams renameParams);
  Future workspaceApplyEdit(ApplyWorkspaceEditParams applyWorkspaceEditParams);
}

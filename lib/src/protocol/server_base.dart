import 'dart:async';
import 'interfaces/interfaces.dart';
abstract class BaseServer {
  FutureOr initialize(InitializeParams initializeParams);
  FutureOr shutdown();
  FutureOr windowShowMessageRequest(ShowMessageRequestParams showMessageRequestParams);
  FutureOr clientUnregisterCapability(UnregistrationParams unregistrationParams);
  FutureOr textDocumentWillSaveWaitUntil(WillSaveTextDocumentParams willSaveTextDocumentParams);
  FutureOr textDocumentCompletion(TextDocumentPositionParams textDocumentPositionParams);
  FutureOr completionItemResolve(CompletionItem completionItem);
  FutureOr textDocumentHover(TextDocumentPositionParams textDocumentPositionParams);
  FutureOr textDocumentSignatureHelp(TextDocumentPositionParams textDocumentPositionParams);
  FutureOr textDocumentDefinition(TextDocumentPositionParams textDocumentPositionParams);
  FutureOr textDocumentReferences(ReferenceParams referenceParams);
  FutureOr textDocumentDocumentHighlight(TextDocumentPositionParams textDocumentPositionParams);
  FutureOr textDocumentDocumentSymbol(DocumentSymbolParams documentSymbolParams);
  FutureOr workspaceSymbol(WorkspaceSymbolParams workspaceSymbolParams);
  FutureOr textDocumentCodeAction(CodeActionParams codeActionParams);
  FutureOr textDocumentCodeLens(CodeLensParams codeLensParams);
  FutureOr codeLensResolve(CodeLens codeLens);
  FutureOr textDocumentDocumentLink(DocumentLinkParams documentLinkParams);
  FutureOr documentLinkResolve(DocumentLink documentLink);
  FutureOr textDocumentFormatting(DocumentFormattingParams documentFormattingParams);
  FutureOr textDocumentRangeFormatting(DocumentRangeFormattingParams documentRangeFormattingParams);
  FutureOr textDocumentOnTypeFormatting(DocumentOnTypeFormattingParams documentOnTypeFormattingParams);
  FutureOr textDocumentRename(RenameParams renameParams);
  FutureOr workspaceApplyEdit(ApplyWorkspaceEditParams applyWorkspaceEditParams);
}

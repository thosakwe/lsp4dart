import 'package:owl/annotation/json.dart';

@JsonClass()
class ClientCapabilities {
  /**
   * Workspace specific client capabilities.
   */
  WorkspaceClientCapabilities workspace;

  /**
   * Text document specific client capabilities.
   */
  TextDocumentClientCapabilities textDocument;

  /**
   * Experimental client capabilities.
   */
  dynamic experimental;

  ClientCapabilities({this.workspace, this.experimental});

  factory ClientCapabilities.fromMap(Map map) => new ClientCapabilities();
}

/**
 * Workspace specific client capabilities.
 */
class WorkspaceClientCapabilities {
  /**
   * The client supports applying batch edits to the workspace by supporting
   * the request 'workspace/applyEdit'
   */
  bool applyEdit;

  /**
   * Capabilities specific to [WorkspaceEditCapabilities]s
   */
  WorkspaceEditCapabilities workspaceEdit;

  /**
   * Capabilities specific to the `workspace/didChangeConfiguration` notification.
   */
  SpecificCapabilities didChangeConfiguration;

  /**
   * Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
   */
  SpecificCapabilities didChangeWatchedFiles;

  /**
   * Capabilities specific to the `workspace/symbol` notification.
   */
  SpecificCapabilities symbol;

  /**
   * Capabilities specific to the `workspace/executeCommand` notification.
   */
  SpecificCapabilities executeCommand;

  WorkspaceClientCapabilities(
      {this.applyEdit,
      this.workspaceEdit,
      this.didChangeConfiguration,
      this.didChangeWatchedFiles,
      this.symbol,
      this.executeCommand});
}

/**
 * Text document specific client capabilities.
 */
class TextDocumentClientCapabilities {
  TextDocumentSynchronizationCapabilities synchronization;

  /**
   * Capabilities specific to the `textDocument/completion`
   */
  TextDocumentCompletionCapabilities completion;

  /**
   * Capabilities specific to the `textDocument/hover`
   */
  SpecificCapabilities hover;

  /**
   * Capabilities specific to the `textDocument/signatureHelp`
   */
  SpecificCapabilities signatureHelp;

  /**
   * Capabilities specific to the `textDocument/references`
   */
  SpecificCapabilities references;

  /**
   * Capabilities specific to the `textDocument/documentHighlight`
   */
  SpecificCapabilities documentHighlight;

  /**
   * Capabilities specific to the `textDocument/documentSymbol`
   */
  SpecificCapabilities documentSymbol;

  /**
   * Capabilities specific to the `textDocument/formatting`
   */
  SpecificCapabilities formatting;

  /**
   * Capabilities specific to the `textDocument/rangeFormatting`
   */
  SpecificCapabilities rangeFormatting;

  /**
   * Capabilities specific to the `textDocument/onTypeFormatting`
   */
  SpecificCapabilities onTypeFormatting;

  /**
   * Capabilities specific to the `textDocument/definition`
   */
  SpecificCapabilities definition;

  /**
   * Capabilities specific to the `textDocument/codeAction`
   */
  SpecificCapabilities codeAction;

  /**
   * Capabilities specific to the `textDocument/codeLens`
   */
  SpecificCapabilities codeLens;

  /**
   * Capabilities specific to the `textDocument/documentLink`
   */
  SpecificCapabilities documentLink;

  /**
   * Capabilities specific to the `textDocument/rename`
   */
  SpecificCapabilities rename;

  TextDocumentClientCapabilities(
      {this.synchronization,
      this.completion,
      this.hover,
      this.signatureHelp,
      this.references,
      this.documentHighlight,
      this.documentSymbol,
      this.formatting,
      this.rangeFormatting,
      this.onTypeFormatting,
      this.definition,
      this.codeAction,
      this.codeLens,
      this.documentLink,
      this.rename});
}

class TextDocumentSynchronizationCapabilities {
  /**
   * Whether text document synchronization supports dynamic registration.
   */
  bool dynamicRegistration;

  /**
   * The client supports sending will save notifications.
   */
  bool willSave;

  /**
   * The client supports sending a will save request and
   * waits for a response providing text edits which will
   * be applied to the document before it is saved.
   */
  bool willSaveWaitUntil;

  /**
   * The client supports did save notifications.
   */
  bool didSave;

  TextDocumentSynchronizationCapabilities(
      {this.dynamicRegistration,
      this.willSave,
      this.willSaveWaitUntil,
      this.didSave});
}

/**
 * Capabilities specific to the `textDocument/completion`
 */
class TextDocumentCompletionCapabilities {
  /**
   * Whether completion supports dynamic registration.
   */
  bool dynamicRegistration;

  /**
   * The client supports the following `CompletionItem` specific
   * capabilities.
   */
  TextDocumentCompletionItemCapabilities completionItem;

  TextDocumentCompletionCapabilities(
      {this.dynamicRegistration, this.completionItem});
}

class TextDocumentCompletionItemCapabilities {
  /**
   * Client supports snippets as insert text.
   *
   * A snippet can define tab stops and placeholders with `$1`, `$2`
   * and `${3:foo}`. `$0` defines the final tab stop, it defaults to
   * the end of the snippet. Placeholders with equal identifiers are linked,
   * that is typing in one will update others too.
   */
  bool snippetSupport;

  TextDocumentCompletionItemCapabilities({this.snippetSupport});
}

class WorkspaceEditCapabilities {
  /**
   * The client supports versioned document changes in `WorkspaceEdit`s
   */
  bool documentChanges;

  WorkspaceEditCapabilities({this.documentChanges});
}

class SpecificCapabilities {
  /// Supports dynamic registration
  bool dynamicRegistration;

  SpecificCapabilities({this.dynamicRegistration});
}

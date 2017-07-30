/// AUTO-GENERATED: Don't even bother modifying.

class Message {
  String jsonrpc;

  Message({this.jsonrpc});

  static Message parse(Map map) {
    return new Message(jsonrpc: map['jsonrpc']);
  }

  Map<String, dynamic> toJson() {
    return {'jsonrpc': jsonrpc};
  }
}

class RequestMessage extends Message {
  dynamic id;

  String method;

  dynamic params;

  String jsonrpc;

  RequestMessage({this.id, this.method, this.params, this.jsonrpc});

  static RequestMessage parse(Map map) {
    return new RequestMessage(
        id: map['id'],
        method: map['method'],
        params: map['params'],
        jsonrpc: map['jsonrpc']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'method': method, 'params': params, 'jsonrpc': jsonrpc};
  }
}

class ResponseMessage extends Message {
  dynamic id;

  dynamic result;

  ResponseError error;

  String jsonrpc;

  ResponseMessage({this.id, this.result, this.error, this.jsonrpc});

  static ResponseMessage parse(Map map) {
    return new ResponseMessage(
        id: map['id'],
        result: map['result'],
        error: map['error'] is! Map ? null : ResponseError.parse(map['error']),
        jsonrpc: map['jsonrpc']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'result': result,
      'error': error?.toJson(),
      'jsonrpc': jsonrpc
    };
  }
}

class ResponseError<D> {
  num code;

  String message;

  D data;

  ResponseError({this.code, this.message, this.data});

  static ResponseError parse(Map map) {
    return new ResponseError(
        code: map['code'], message: map['message'], data: map['data']);
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message, 'data': data};
  }
}

class NotificationMessage extends Message {
  String method;

  dynamic params;

  String jsonrpc;

  NotificationMessage({this.method, this.params, this.jsonrpc});

  static NotificationMessage parse(Map map) {
    return new NotificationMessage(
        method: map['method'], params: map['params'], jsonrpc: map['jsonrpc']);
  }

  Map<String, dynamic> toJson() {
    return {'method': method, 'params': params, 'jsonrpc': jsonrpc};
  }
}

class CancelParams {
  dynamic id;

  CancelParams({this.id});

  static CancelParams parse(Map map) {
    return new CancelParams(id: map['id']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}

class Position {
  num line;

  num character;

  Position({this.line, this.character});

  static Position parse(Map map) {
    return new Position(line: map['line'], character: map['character']);
  }

  Map<String, dynamic> toJson() {
    return {'line': line, 'character': character};
  }
}

class Range {
  Position start;

  Position end;

  Range({this.start, this.end});

  static Range parse(Map map) {
    return new Range(
        start: map['start'] is! Map ? null : Position.parse(map['start']),
        end: map['end'] is! Map ? null : Position.parse(map['end']));
  }

  Map<String, dynamic> toJson() {
    return {'start': start?.toJson(), 'end': end?.toJson()};
  }
}

class Location {
  String uri;

  Range range;

  Location({this.uri, this.range});

  static Location parse(Map map) {
    return new Location(
        uri: map['uri'],
        range: map['range'] is! Map ? null : Range.parse(map['range']));
  }

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'range': range?.toJson()};
  }
}

class Diagnostic {
  Range range;

  num severity;

  dynamic code;

  String source;

  String message;

  Diagnostic({this.range, this.severity, this.code, this.source, this.message});

  static Diagnostic parse(Map map) {
    return new Diagnostic(
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        severity: map['severity'],
        code: map['code'],
        source: map['source'],
        message: map['message']);
  }

  Map<String, dynamic> toJson() {
    return {
      'range': range?.toJson(),
      'severity': severity,
      'code': code,
      'source': source,
      'message': message
    };
  }
}

class Command {
  String title;

  String command;

  List<dynamic> arguments;

  Command({this.title, this.command, this.arguments});

  static Command parse(Map map) {
    return new Command(
        title: map['title'],
        command: map['command'],
        arguments: map['arguments']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'command': command, 'arguments': arguments};
  }
}

class TextEdit {
  Range range;

  String newText;

  TextEdit({this.range, this.newText});

  static TextEdit parse(Map map) {
    return new TextEdit(
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        newText: map['newText']);
  }

  Map<String, dynamic> toJson() {
    return {'range': range?.toJson(), 'newText': newText};
  }
}

class TextDocumentEdit {
  VersionedTextDocumentIdentifier textDocument;

  List<TextEdit> edits;

  TextDocumentEdit({this.textDocument, this.edits});

  static TextDocumentEdit parse(Map map) {
    return new TextDocumentEdit(
        textDocument: map['textDocument'] is! Map
            ? null
            : VersionedTextDocumentIdentifier.parse(map['textDocument']),
        edits: map['edits'] is! Iterable
            ? null
            : map['edits'].map<TextEdit>(TextEdit.parse).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'edits': edits?.map((x) => x.toJson())
    };
  }
}

class WorkspaceEdit {
  Map<String, List<TextEdit>> changes;

  List<TextDocumentEdit> documentChanges;

  WorkspaceEdit({this.changes, this.documentChanges});

  static WorkspaceEdit parse(Map map) {
    return new WorkspaceEdit(
        changes: map['changes'],
        documentChanges: map['documentChanges'] is! Iterable
            ? null
            : map['documentChanges']
                .map<TextDocumentEdit>(TextDocumentEdit.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'changes': changes,
      'documentChanges': documentChanges?.map((x) => x.toJson())
    };
  }
}

class TextDocumentIdentifier {
  String uri;

  TextDocumentIdentifier({this.uri});

  static TextDocumentIdentifier parse(Map map) {
    return new TextDocumentIdentifier(uri: map['uri']);
  }

  Map<String, dynamic> toJson() {
    return {'uri': uri};
  }
}

class TextDocumentItem {
  String uri;

  String languageId;

  num version;

  String text;

  TextDocumentItem({this.uri, this.languageId, this.version, this.text});

  static TextDocumentItem parse(Map map) {
    return new TextDocumentItem(
        uri: map['uri'],
        languageId: map['languageId'],
        version: map['version'],
        text: map['text']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uri': uri,
      'languageId': languageId,
      'version': version,
      'text': text
    };
  }
}

class VersionedTextDocumentIdentifier extends TextDocumentIdentifier {
  num version;

  String uri;

  VersionedTextDocumentIdentifier({this.version, this.uri});

  static VersionedTextDocumentIdentifier parse(Map map) {
    return new VersionedTextDocumentIdentifier(
        version: map['version'], uri: map['uri']);
  }

  Map<String, dynamic> toJson() {
    return {'version': version, 'uri': uri};
  }
}

class TextDocumentPositionParams {
  TextDocumentIdentifier textDocument;

  Position position;

  TextDocumentPositionParams({this.textDocument, this.position});

  static TextDocumentPositionParams parse(Map map) {
    return new TextDocumentPositionParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        position:
            map['position'] is! Map ? null : Position.parse(map['position']));
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'position': position?.toJson()
    };
  }
}

class DocumentFilter {
  String language;

  String scheme;

  String pattern;

  DocumentFilter({this.language, this.scheme, this.pattern});

  static DocumentFilter parse(Map map) {
    return new DocumentFilter(
        language: map['language'],
        scheme: map['scheme'],
        pattern: map['pattern']);
  }

  Map<String, dynamic> toJson() {
    return {'language': language, 'scheme': scheme, 'pattern': pattern};
  }
}

class InitializeParams {
  num processId;

  String rootPath;

  String rootUri;

  dynamic initializationOptions;

  ClientCapabilities capabilities;

  String trace;

  InitializeParams(
      {this.processId,
      this.rootPath,
      this.rootUri,
      this.initializationOptions,
      this.capabilities,
      this.trace});

  static InitializeParams parse(Map map) {
    return new InitializeParams(
        processId: map['processId'],
        rootPath: map['rootPath'],
        rootUri: map['rootUri'],
        initializationOptions: map['initializationOptions'],
        capabilities: map['capabilities'] is! Map
            ? null
            : ClientCapabilities.parse(map['capabilities']),
        trace: map['trace']);
  }

  Map<String, dynamic> toJson() {
    return {
      'processId': processId,
      'rootPath': rootPath,
      'rootUri': rootUri,
      'initializationOptions': initializationOptions,
      'capabilities': capabilities?.toJson(),
      'trace': trace
    };
  }
}

class WorkspaceClientCapabilities {
  bool applyEdit;

  WorkspaceClientCapabilitiesWorkspaceEdit workspaceEdit;

  WorkspaceClientCapabilitiesDidChangeConfiguration didChangeConfiguration;

  WorkspaceClientCapabilitiesDidChangeWatchedFiles didChangeWatchedFiles;

  WorkspaceClientCapabilitiesSymbol symbol;

  WorkspaceClientCapabilitiesExecuteCommand executeCommand;

  WorkspaceClientCapabilities(
      {this.applyEdit,
      this.workspaceEdit,
      this.didChangeConfiguration,
      this.didChangeWatchedFiles,
      this.symbol,
      this.executeCommand});

  static WorkspaceClientCapabilities parse(Map map) {
    return new WorkspaceClientCapabilities(
        applyEdit: map['applyEdit'],
        workspaceEdit: map['workspaceEdit'] is! Map
            ? null
            : WorkspaceClientCapabilitiesWorkspaceEdit
                .parse(map['workspaceEdit']),
        didChangeConfiguration: map['didChangeConfiguration'] is! Map
            ? null
            : WorkspaceClientCapabilitiesDidChangeConfiguration
                .parse(map['didChangeConfiguration']),
        didChangeWatchedFiles: map['didChangeWatchedFiles'] is! Map
            ? null
            : WorkspaceClientCapabilitiesDidChangeWatchedFiles
                .parse(map['didChangeWatchedFiles']),
        symbol: map['symbol'] is! Map
            ? null
            : WorkspaceClientCapabilitiesSymbol.parse(map['symbol']),
        executeCommand: map['executeCommand'] is! Map
            ? null
            : WorkspaceClientCapabilitiesExecuteCommand
                .parse(map['executeCommand']));
  }

  Map<String, dynamic> toJson() {
    return {
      'applyEdit': applyEdit,
      'workspaceEdit': workspaceEdit?.toJson(),
      'didChangeConfiguration': didChangeConfiguration?.toJson(),
      'didChangeWatchedFiles': didChangeWatchedFiles?.toJson(),
      'symbol': symbol?.toJson(),
      'executeCommand': executeCommand?.toJson()
    };
  }
}

class TextDocumentClientCapabilities {
  TextDocumentClientCapabilitiesSynchronization synchronization;

  TextDocumentClientCapabilitiesCompletion completion;

  TextDocumentClientCapabilitiesHover hover;

  TextDocumentClientCapabilitiesSignatureHelp signatureHelp;

  TextDocumentClientCapabilitiesReferences references;

  TextDocumentClientCapabilitiesDocumentHighlight documentHighlight;

  TextDocumentClientCapabilitiesDocumentSymbol documentSymbol;

  TextDocumentClientCapabilitiesFormatting formatting;

  TextDocumentClientCapabilitiesRangeFormatting rangeFormatting;

  TextDocumentClientCapabilitiesOnTypeFormatting onTypeFormatting;

  TextDocumentClientCapabilitiesDefinition definition;

  TextDocumentClientCapabilitiesCodeAction codeAction;

  TextDocumentClientCapabilitiesCodeLens codeLens;

  TextDocumentClientCapabilitiesDocumentLink documentLink;

  TextDocumentClientCapabilitiesRename rename;

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

  static TextDocumentClientCapabilities parse(Map map) {
    return new TextDocumentClientCapabilities(
        synchronization: map['synchronization'] is! Map
            ? null
            : TextDocumentClientCapabilitiesSynchronization
                .parse(map['synchronization']),
        completion: map['completion'] is! Map
            ? null
            : TextDocumentClientCapabilitiesCompletion.parse(map['completion']),
        hover: map['hover'] is! Map
            ? null
            : TextDocumentClientCapabilitiesHover.parse(map['hover']),
        signatureHelp: map['signatureHelp'] is! Map
            ? null
            : TextDocumentClientCapabilitiesSignatureHelp
                .parse(map['signatureHelp']),
        references: map['references'] is! Map
            ? null
            : TextDocumentClientCapabilitiesReferences.parse(map['references']),
        documentHighlight: map['documentHighlight'] is! Map
            ? null
            : TextDocumentClientCapabilitiesDocumentHighlight
                .parse(map['documentHighlight']),
        documentSymbol: map['documentSymbol'] is! Map
            ? null
            : TextDocumentClientCapabilitiesDocumentSymbol
                .parse(map['documentSymbol']),
        formatting: map['formatting'] is! Map
            ? null
            : TextDocumentClientCapabilitiesFormatting.parse(map['formatting']),
        rangeFormatting: map['rangeFormatting'] is! Map
            ? null
            : TextDocumentClientCapabilitiesRangeFormatting
                .parse(map['rangeFormatting']),
        onTypeFormatting: map['onTypeFormatting'] is! Map
            ? null
            : TextDocumentClientCapabilitiesOnTypeFormatting
                .parse(map['onTypeFormatting']),
        definition: map['definition'] is! Map
            ? null
            : TextDocumentClientCapabilitiesDefinition.parse(map['definition']),
        codeAction: map['codeAction'] is! Map
            ? null
            : TextDocumentClientCapabilitiesCodeAction.parse(map['codeAction']),
        codeLens: map['codeLens'] is! Map
            ? null
            : TextDocumentClientCapabilitiesCodeLens.parse(map['codeLens']),
        documentLink: map['documentLink'] is! Map
            ? null
            : TextDocumentClientCapabilitiesDocumentLink
                .parse(map['documentLink']),
        rename: map['rename'] is! Map
            ? null
            : TextDocumentClientCapabilitiesRename.parse(map['rename']));
  }

  Map<String, dynamic> toJson() {
    return {
      'synchronization': synchronization?.toJson(),
      'completion': completion?.toJson(),
      'hover': hover?.toJson(),
      'signatureHelp': signatureHelp?.toJson(),
      'references': references?.toJson(),
      'documentHighlight': documentHighlight?.toJson(),
      'documentSymbol': documentSymbol?.toJson(),
      'formatting': formatting?.toJson(),
      'rangeFormatting': rangeFormatting?.toJson(),
      'onTypeFormatting': onTypeFormatting?.toJson(),
      'definition': definition?.toJson(),
      'codeAction': codeAction?.toJson(),
      'codeLens': codeLens?.toJson(),
      'documentLink': documentLink?.toJson(),
      'rename': rename?.toJson()
    };
  }
}

class ClientCapabilities {
  WorkspaceClientCapabilities workspace;

  TextDocumentClientCapabilities textDocument;

  dynamic experimental;

  ClientCapabilities({this.workspace, this.textDocument, this.experimental});

  static ClientCapabilities parse(Map map) {
    return new ClientCapabilities(
        workspace: map['workspace'] is! Map
            ? null
            : WorkspaceClientCapabilities.parse(map['workspace']),
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentClientCapabilities.parse(map['textDocument']),
        experimental: map['experimental']);
  }

  Map<String, dynamic> toJson() {
    return {
      'workspace': workspace?.toJson(),
      'textDocument': textDocument?.toJson(),
      'experimental': experimental
    };
  }
}

class InitializeResult {
  ServerCapabilities capabilities;

  InitializeResult({this.capabilities});

  static InitializeResult parse(Map map) {
    return new InitializeResult(
        capabilities: map['capabilities'] is! Map
            ? null
            : ServerCapabilities.parse(map['capabilities']));
  }

  Map<String, dynamic> toJson() {
    return {'capabilities': capabilities?.toJson()};
  }
}

class InitializeError {
  bool retry;

  InitializeError({this.retry});

  static InitializeError parse(Map map) {
    return new InitializeError(retry: map['retry']);
  }

  Map<String, dynamic> toJson() {
    return {'retry': retry};
  }
}

class CompletionOptions {
  bool resolveProvider;

  List<String> triggerCharacters;

  CompletionOptions({this.resolveProvider, this.triggerCharacters});

  static CompletionOptions parse(Map map) {
    return new CompletionOptions(
        resolveProvider: map['resolveProvider'],
        triggerCharacters: map['triggerCharacters']);
  }

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'triggerCharacters': triggerCharacters
    };
  }
}

class SignatureHelpOptions {
  List<String> triggerCharacters;

  SignatureHelpOptions({this.triggerCharacters});

  static SignatureHelpOptions parse(Map map) {
    return new SignatureHelpOptions(
        triggerCharacters: map['triggerCharacters']);
  }

  Map<String, dynamic> toJson() {
    return {'triggerCharacters': triggerCharacters};
  }
}

class CodeLensOptions {
  bool resolveProvider;

  CodeLensOptions({this.resolveProvider});

  static CodeLensOptions parse(Map map) {
    return new CodeLensOptions(resolveProvider: map['resolveProvider']);
  }

  Map<String, dynamic> toJson() {
    return {'resolveProvider': resolveProvider};
  }
}

class DocumentOnTypeFormattingOptions {
  String firstTriggerCharacter;

  List<String> moreTriggerCharacter;

  DocumentOnTypeFormattingOptions(
      {this.firstTriggerCharacter, this.moreTriggerCharacter});

  static DocumentOnTypeFormattingOptions parse(Map map) {
    return new DocumentOnTypeFormattingOptions(
        firstTriggerCharacter: map['firstTriggerCharacter'],
        moreTriggerCharacter: map['moreTriggerCharacter']);
  }

  Map<String, dynamic> toJson() {
    return {
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter
    };
  }
}

class DocumentLinkOptions {
  bool resolveProvider;

  DocumentLinkOptions({this.resolveProvider});

  static DocumentLinkOptions parse(Map map) {
    return new DocumentLinkOptions(resolveProvider: map['resolveProvider']);
  }

  Map<String, dynamic> toJson() {
    return {'resolveProvider': resolveProvider};
  }
}

class ExecuteCommandOptions {
  List<String> commands;

  ExecuteCommandOptions({this.commands});

  static ExecuteCommandOptions parse(Map map) {
    return new ExecuteCommandOptions(commands: map['commands']);
  }

  Map<String, dynamic> toJson() {
    return {'commands': commands};
  }
}

class SaveOptions {
  bool includeText;

  SaveOptions({this.includeText});

  static SaveOptions parse(Map map) {
    return new SaveOptions(includeText: map['includeText']);
  }

  Map<String, dynamic> toJson() {
    return {'includeText': includeText};
  }
}

class TextDocumentSyncOptions {
  bool openClose;

  num change;

  bool willSave;

  bool willSaveWaitUntil;

  SaveOptions save;

  TextDocumentSyncOptions(
      {this.openClose,
      this.change,
      this.willSave,
      this.willSaveWaitUntil,
      this.save});

  static TextDocumentSyncOptions parse(Map map) {
    return new TextDocumentSyncOptions(
        openClose: map['openClose'],
        change: map['change'],
        willSave: map['willSave'],
        willSaveWaitUntil: map['willSaveWaitUntil'],
        save: map['save'] is! Map ? null : SaveOptions.parse(map['save']));
  }

  Map<String, dynamic> toJson() {
    return {
      'openClose': openClose,
      'change': change,
      'willSave': willSave,
      'willSaveWaitUntil': willSaveWaitUntil,
      'save': save?.toJson()
    };
  }
}

class ServerCapabilities {
  dynamic textDocumentSync;

  bool hoverProvider;

  CompletionOptions completionProvider;

  SignatureHelpOptions signatureHelpProvider;

  bool definitionProvider;

  bool referencesProvider;

  bool documentHighlightProvider;

  bool documentSymbolProvider;

  bool workspaceSymbolProvider;

  bool codeActionProvider;

  CodeLensOptions codeLensProvider;

  bool documentFormattingProvider;

  bool documentRangeFormattingProvider;

  DocumentOnTypeFormattingOptions documentOnTypeFormattingProvider;

  bool renameProvider;

  DocumentLinkOptions documentLinkProvider;

  ExecuteCommandOptions executeCommandProvider;

  dynamic experimental;

  ServerCapabilities(
      {this.textDocumentSync,
      this.hoverProvider,
      this.completionProvider,
      this.signatureHelpProvider,
      this.definitionProvider,
      this.referencesProvider,
      this.documentHighlightProvider,
      this.documentSymbolProvider,
      this.workspaceSymbolProvider,
      this.codeActionProvider,
      this.codeLensProvider,
      this.documentFormattingProvider,
      this.documentRangeFormattingProvider,
      this.documentOnTypeFormattingProvider,
      this.renameProvider,
      this.documentLinkProvider,
      this.executeCommandProvider,
      this.experimental});

  static ServerCapabilities parse(Map map) {
    return new ServerCapabilities(
        textDocumentSync: map['textDocumentSync'],
        hoverProvider: map['hoverProvider'],
        completionProvider: map['completionProvider'] is! Map
            ? null
            : CompletionOptions.parse(map['completionProvider']),
        signatureHelpProvider: map['signatureHelpProvider'] is! Map
            ? null
            : SignatureHelpOptions.parse(map['signatureHelpProvider']),
        definitionProvider: map['definitionProvider'],
        referencesProvider: map['referencesProvider'],
        documentHighlightProvider: map['documentHighlightProvider'],
        documentSymbolProvider: map['documentSymbolProvider'],
        workspaceSymbolProvider: map['workspaceSymbolProvider'],
        codeActionProvider: map['codeActionProvider'],
        codeLensProvider: map['codeLensProvider'] is! Map
            ? null
            : CodeLensOptions.parse(map['codeLensProvider']),
        documentFormattingProvider: map['documentFormattingProvider'],
        documentRangeFormattingProvider: map['documentRangeFormattingProvider'],
        documentOnTypeFormattingProvider:
            map['documentOnTypeFormattingProvider'] is! Map
                ? null
                : DocumentOnTypeFormattingOptions
                    .parse(map['documentOnTypeFormattingProvider']),
        renameProvider: map['renameProvider'],
        documentLinkProvider: map['documentLinkProvider'] is! Map
            ? null
            : DocumentLinkOptions.parse(map['documentLinkProvider']),
        executeCommandProvider: map['executeCommandProvider'] is! Map
            ? null
            : ExecuteCommandOptions.parse(map['executeCommandProvider']),
        experimental: map['experimental']);
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocumentSync': textDocumentSync,
      'hoverProvider': hoverProvider,
      'completionProvider': completionProvider?.toJson(),
      'signatureHelpProvider': signatureHelpProvider?.toJson(),
      'definitionProvider': definitionProvider,
      'referencesProvider': referencesProvider,
      'documentHighlightProvider': documentHighlightProvider,
      'documentSymbolProvider': documentSymbolProvider,
      'workspaceSymbolProvider': workspaceSymbolProvider,
      'codeActionProvider': codeActionProvider,
      'codeLensProvider': codeLensProvider?.toJson(),
      'documentFormattingProvider': documentFormattingProvider,
      'documentRangeFormattingProvider': documentRangeFormattingProvider,
      'documentOnTypeFormattingProvider':
          documentOnTypeFormattingProvider?.toJson(),
      'renameProvider': renameProvider,
      'documentLinkProvider': documentLinkProvider?.toJson(),
      'executeCommandProvider': executeCommandProvider?.toJson(),
      'experimental': experimental
    };
  }
}

class ShowMessageParams {
  num type;

  String message;

  ShowMessageParams({this.type, this.message});

  static ShowMessageParams parse(Map map) {
    return new ShowMessageParams(type: map['type'], message: map['message']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'message': message};
  }
}

class ShowMessageRequestParams {
  num type;

  String message;

  List<MessageActionItem> actions;

  ShowMessageRequestParams({this.type, this.message, this.actions});

  static ShowMessageRequestParams parse(Map map) {
    return new ShowMessageRequestParams(
        type: map['type'],
        message: map['message'],
        actions: map['actions'] is! Iterable
            ? null
            : map['actions']
                .map<MessageActionItem>(MessageActionItem.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'message': message,
      'actions': actions?.map((x) => x.toJson())
    };
  }
}

class MessageActionItem {
  String title;

  MessageActionItem({this.title});

  static MessageActionItem parse(Map map) {
    return new MessageActionItem(title: map['title']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}

class LogMessageParams {
  num type;

  String message;

  LogMessageParams({this.type, this.message});

  static LogMessageParams parse(Map map) {
    return new LogMessageParams(type: map['type'], message: map['message']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'message': message};
  }
}

class Registration {
  String id;

  String method;

  dynamic registerOptions;

  Registration({this.id, this.method, this.registerOptions});

  static Registration parse(Map map) {
    return new Registration(
        id: map['id'],
        method: map['method'],
        registerOptions: map['registerOptions']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'method': method, 'registerOptions': registerOptions};
  }
}

class RegistrationParams {
  List<Registration> registrations;

  RegistrationParams({this.registrations});

  static RegistrationParams parse(Map map) {
    return new RegistrationParams(
        registrations: map['registrations'] is! Iterable
            ? null
            : map['registrations']
                .map<Registration>(Registration.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {'registrations': registrations?.map((x) => x.toJson())};
  }
}

class TextDocumentRegistrationOptions {
  List<DocumentFilter> documentSelector;

  TextDocumentRegistrationOptions({this.documentSelector});

  static TextDocumentRegistrationOptions parse(Map map) {
    return new TextDocumentRegistrationOptions(
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {'documentSelector': documentSelector?.map((x) => x.toJson())};
  }
}

class Unregistration {
  String id;

  String method;

  Unregistration({this.id, this.method});

  static Unregistration parse(Map map) {
    return new Unregistration(id: map['id'], method: map['method']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'method': method};
  }
}

class UnregistrationParams {
  List<Unregistration> unregisterations;

  UnregistrationParams({this.unregisterations});

  static UnregistrationParams parse(Map map) {
    return new UnregistrationParams(
        unregisterations: map['unregisterations'] is! Iterable
            ? null
            : map['unregisterations']
                .map<Unregistration>(Unregistration.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {'unregisterations': unregisterations?.map((x) => x.toJson())};
  }
}

class DidChangeConfigurationParams {
  dynamic settings;

  DidChangeConfigurationParams({this.settings});

  static DidChangeConfigurationParams parse(Map map) {
    return new DidChangeConfigurationParams(settings: map['settings']);
  }

  Map<String, dynamic> toJson() {
    return {'settings': settings};
  }
}

class DidOpenTextDocumentParams {
  TextDocumentItem textDocument;

  DidOpenTextDocumentParams({this.textDocument});

  static DidOpenTextDocumentParams parse(Map map) {
    return new DidOpenTextDocumentParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentItem.parse(map['textDocument']));
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson()};
  }
}

class DidChangeTextDocumentParams {
  VersionedTextDocumentIdentifier textDocument;

  List<TextDocumentContentChangeEvent> contentChanges;

  DidChangeTextDocumentParams({this.textDocument, this.contentChanges});

  static DidChangeTextDocumentParams parse(Map map) {
    return new DidChangeTextDocumentParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : VersionedTextDocumentIdentifier.parse(map['textDocument']),
        contentChanges: map['contentChanges'] is! Iterable
            ? null
            : map['contentChanges']
                .map<TextDocumentContentChangeEvent>(
                    TextDocumentContentChangeEvent.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'contentChanges': contentChanges?.map((x) => x.toJson())
    };
  }
}

class TextDocumentContentChangeEvent {
  Range range;

  num rangeLength;

  String text;

  TextDocumentContentChangeEvent({this.range, this.rangeLength, this.text});

  static TextDocumentContentChangeEvent parse(Map map) {
    return new TextDocumentContentChangeEvent(
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        rangeLength: map['rangeLength'],
        text: map['text']);
  }

  Map<String, dynamic> toJson() {
    return {'range': range?.toJson(), 'rangeLength': rangeLength, 'text': text};
  }
}

class TextDocumentChangeRegistrationOptions
    extends TextDocumentRegistrationOptions {
  num syncKind;

  List<DocumentFilter> documentSelector;

  TextDocumentChangeRegistrationOptions({this.syncKind, this.documentSelector});

  static TextDocumentChangeRegistrationOptions parse(Map map) {
    return new TextDocumentChangeRegistrationOptions(
        syncKind: map['syncKind'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'syncKind': syncKind,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class WillSaveTextDocumentParams {
  TextDocumentIdentifier textDocument;

  num reason;

  WillSaveTextDocumentParams({this.textDocument, this.reason});

  static WillSaveTextDocumentParams parse(Map map) {
    return new WillSaveTextDocumentParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        reason: map['reason']);
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson(), 'reason': reason};
  }
}

class DidSaveTextDocumentParams {
  TextDocumentIdentifier textDocument;

  String text;

  DidSaveTextDocumentParams({this.textDocument, this.text});

  static DidSaveTextDocumentParams parse(Map map) {
    return new DidSaveTextDocumentParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        text: map['text']);
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson(), 'text': text};
  }
}

class TextDocumentSaveRegistrationOptions
    extends TextDocumentRegistrationOptions {
  bool includeText;

  List<DocumentFilter> documentSelector;

  TextDocumentSaveRegistrationOptions(
      {this.includeText, this.documentSelector});

  static TextDocumentSaveRegistrationOptions parse(Map map) {
    return new TextDocumentSaveRegistrationOptions(
        includeText: map['includeText'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'includeText': includeText,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class DidCloseTextDocumentParams {
  TextDocumentIdentifier textDocument;

  DidCloseTextDocumentParams({this.textDocument});

  static DidCloseTextDocumentParams parse(Map map) {
    return new DidCloseTextDocumentParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']));
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson()};
  }
}

class DidChangeWatchedFilesParams {
  List<FileEvent> changes;

  DidChangeWatchedFilesParams({this.changes});

  static DidChangeWatchedFilesParams parse(Map map) {
    return new DidChangeWatchedFilesParams(
        changes: map['changes'] is! Iterable
            ? null
            : map['changes'].map<FileEvent>(FileEvent.parse).toList());
  }

  Map<String, dynamic> toJson() {
    return {'changes': changes?.map((x) => x.toJson())};
  }
}

class FileEvent {
  String uri;

  num type;

  FileEvent({this.uri, this.type});

  static FileEvent parse(Map map) {
    return new FileEvent(uri: map['uri'], type: map['type']);
  }

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'type': type};
  }
}

class PublishDiagnosticsParams {
  String uri;

  List<Diagnostic> diagnostics;

  PublishDiagnosticsParams({this.uri, this.diagnostics});

  static PublishDiagnosticsParams parse(Map map) {
    return new PublishDiagnosticsParams(
        uri: map['uri'],
        diagnostics: map['diagnostics'] is! Iterable
            ? null
            : map['diagnostics'].map<Diagnostic>(Diagnostic.parse).toList());
  }

  Map<String, dynamic> toJson() {
    return {'uri': uri, 'diagnostics': diagnostics?.map((x) => x.toJson())};
  }
}

class CompletionList {
  bool isIncomplete;

  List<CompletionItem> items;

  CompletionList({this.isIncomplete, this.items});

  static CompletionList parse(Map map) {
    return new CompletionList(
        isIncomplete: map['isIncomplete'],
        items: map['items'] is! Iterable
            ? null
            : map['items'].map<CompletionItem>(CompletionItem.parse).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'isIncomplete': isIncomplete,
      'items': items?.map((x) => x.toJson())
    };
  }
}

class CompletionItem {
  String label;

  num kind;

  String detail;

  String documentation;

  String sortText;

  String filterText;

  String insertText;

  num insertTextFormat;

  TextEdit textEdit;

  List<TextEdit> additionalTextEdits;

  Command command;

  dynamic data;

  CompletionItem(
      {this.label,
      this.kind,
      this.detail,
      this.documentation,
      this.sortText,
      this.filterText,
      this.insertText,
      this.insertTextFormat,
      this.textEdit,
      this.additionalTextEdits,
      this.command,
      this.data});

  static CompletionItem parse(Map map) {
    return new CompletionItem(
        label: map['label'],
        kind: map['kind'],
        detail: map['detail'],
        documentation: map['documentation'],
        sortText: map['sortText'],
        filterText: map['filterText'],
        insertText: map['insertText'],
        insertTextFormat: map['insertTextFormat'],
        textEdit:
            map['textEdit'] is! Map ? null : TextEdit.parse(map['textEdit']),
        additionalTextEdits: map['additionalTextEdits'] is! Iterable
            ? null
            : map['additionalTextEdits'].map<TextEdit>(TextEdit.parse).toList(),
        command: map['command'] is! Map ? null : Command.parse(map['command']),
        data: map['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'kind': kind,
      'detail': detail,
      'documentation': documentation,
      'sortText': sortText,
      'filterText': filterText,
      'insertText': insertText,
      'insertTextFormat': insertTextFormat,
      'textEdit': textEdit?.toJson(),
      'additionalTextEdits': additionalTextEdits?.map((x) => x.toJson()),
      'command': command?.toJson(),
      'data': data
    };
  }
}

class CompletionRegistrationOptions extends TextDocumentRegistrationOptions {
  List<String> triggerCharacters;

  bool resolveProvider;

  List<DocumentFilter> documentSelector;

  CompletionRegistrationOptions(
      {this.triggerCharacters, this.resolveProvider, this.documentSelector});

  static CompletionRegistrationOptions parse(Map map) {
    return new CompletionRegistrationOptions(
        triggerCharacters: map['triggerCharacters'],
        resolveProvider: map['resolveProvider'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'triggerCharacters': triggerCharacters,
      'resolveProvider': resolveProvider,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class Hover {
  dynamic contents;

  Range range;

  Hover({this.contents, this.range});

  static Hover parse(Map map) {
    return new Hover(
        contents: map['contents'],
        range: map['range'] is! Map ? null : Range.parse(map['range']));
  }

  Map<String, dynamic> toJson() {
    return {'contents': contents, 'range': range?.toJson()};
  }
}

class SignatureHelp {
  List<SignatureInformation> signatures;

  num activeSignature;

  num activeParameter;

  SignatureHelp({this.signatures, this.activeSignature, this.activeParameter});

  static SignatureHelp parse(Map map) {
    return new SignatureHelp(
        signatures: map['signatures'] is! Iterable
            ? null
            : map['signatures']
                .map<SignatureInformation>(SignatureInformation.parse)
                .toList(),
        activeSignature: map['activeSignature'],
        activeParameter: map['activeParameter']);
  }

  Map<String, dynamic> toJson() {
    return {
      'signatures': signatures?.map((x) => x.toJson()),
      'activeSignature': activeSignature,
      'activeParameter': activeParameter
    };
  }
}

class SignatureInformation {
  String label;

  String documentation;

  List<ParameterInformation> parameters;

  SignatureInformation({this.label, this.documentation, this.parameters});

  static SignatureInformation parse(Map map) {
    return new SignatureInformation(
        label: map['label'],
        documentation: map['documentation'],
        parameters: map['parameters'] is! Iterable
            ? null
            : map['parameters']
                .map<ParameterInformation>(ParameterInformation.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'documentation': documentation,
      'parameters': parameters?.map((x) => x.toJson())
    };
  }
}

class ParameterInformation {
  String label;

  String documentation;

  ParameterInformation({this.label, this.documentation});

  static ParameterInformation parse(Map map) {
    return new ParameterInformation(
        label: map['label'], documentation: map['documentation']);
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'documentation': documentation};
  }
}

class SignatureHelpRegistrationOptions extends TextDocumentRegistrationOptions {
  List<String> triggerCharacters;

  List<DocumentFilter> documentSelector;

  SignatureHelpRegistrationOptions(
      {this.triggerCharacters, this.documentSelector});

  static SignatureHelpRegistrationOptions parse(Map map) {
    return new SignatureHelpRegistrationOptions(
        triggerCharacters: map['triggerCharacters'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'triggerCharacters': triggerCharacters,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class ReferenceParams extends TextDocumentPositionParams {
  ReferenceContext context;

  TextDocumentIdentifier textDocument;

  Position position;

  ReferenceParams({this.context, this.textDocument, this.position});

  static ReferenceParams parse(Map map) {
    return new ReferenceParams(
        context: map['context'] is! Map
            ? null
            : ReferenceContext.parse(map['context']),
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        position:
            map['position'] is! Map ? null : Position.parse(map['position']));
  }

  Map<String, dynamic> toJson() {
    return {
      'context': context?.toJson(),
      'textDocument': textDocument?.toJson(),
      'position': position?.toJson()
    };
  }
}

class ReferenceContext {
  bool includeDeclaration;

  ReferenceContext({this.includeDeclaration});

  static ReferenceContext parse(Map map) {
    return new ReferenceContext(includeDeclaration: map['includeDeclaration']);
  }

  Map<String, dynamic> toJson() {
    return {'includeDeclaration': includeDeclaration};
  }
}

class DocumentHighlight {
  Range range;

  num kind;

  DocumentHighlight({this.range, this.kind});

  static DocumentHighlight parse(Map map) {
    return new DocumentHighlight(
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        kind: map['kind']);
  }

  Map<String, dynamic> toJson() {
    return {'range': range?.toJson(), 'kind': kind};
  }
}

class DocumentSymbolParams {
  TextDocumentIdentifier textDocument;

  DocumentSymbolParams({this.textDocument});

  static DocumentSymbolParams parse(Map map) {
    return new DocumentSymbolParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']));
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson()};
  }
}

class SymbolInformation {
  String name;

  num kind;

  Location location;

  String containerName;

  SymbolInformation({this.name, this.kind, this.location, this.containerName});

  static SymbolInformation parse(Map map) {
    return new SymbolInformation(
        name: map['name'],
        kind: map['kind'],
        location:
            map['location'] is! Map ? null : Location.parse(map['location']),
        containerName: map['containerName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'kind': kind,
      'location': location?.toJson(),
      'containerName': containerName
    };
  }
}

class WorkspaceSymbolParams {
  String query;

  WorkspaceSymbolParams({this.query});

  static WorkspaceSymbolParams parse(Map map) {
    return new WorkspaceSymbolParams(query: map['query']);
  }

  Map<String, dynamic> toJson() {
    return {'query': query};
  }
}

class CodeActionParams {
  TextDocumentIdentifier textDocument;

  Range range;

  CodeActionContext context;

  CodeActionParams({this.textDocument, this.range, this.context});

  static CodeActionParams parse(Map map) {
    return new CodeActionParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        context: map['context'] is! Map
            ? null
            : CodeActionContext.parse(map['context']));
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'range': range?.toJson(),
      'context': context?.toJson()
    };
  }
}

class CodeActionContext {
  List<Diagnostic> diagnostics;

  CodeActionContext({this.diagnostics});

  static CodeActionContext parse(Map map) {
    return new CodeActionContext(
        diagnostics: map['diagnostics'] is! Iterable
            ? null
            : map['diagnostics'].map<Diagnostic>(Diagnostic.parse).toList());
  }

  Map<String, dynamic> toJson() {
    return {'diagnostics': diagnostics?.map((x) => x.toJson())};
  }
}

class CodeLensParams {
  TextDocumentIdentifier textDocument;

  CodeLensParams({this.textDocument});

  static CodeLensParams parse(Map map) {
    return new CodeLensParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']));
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson()};
  }
}

class CodeLens {
  Range range;

  Command command;

  dynamic data;

  CodeLens({this.range, this.command, this.data});

  static CodeLens parse(Map map) {
    return new CodeLens(
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        command: map['command'] is! Map ? null : Command.parse(map['command']),
        data: map['data']);
  }

  Map<String, dynamic> toJson() {
    return {
      'range': range?.toJson(),
      'command': command?.toJson(),
      'data': data
    };
  }
}

class CodeLensRegistrationOptions extends TextDocumentRegistrationOptions {
  bool resolveProvider;

  List<DocumentFilter> documentSelector;

  CodeLensRegistrationOptions({this.resolveProvider, this.documentSelector});

  static CodeLensRegistrationOptions parse(Map map) {
    return new CodeLensRegistrationOptions(
        resolveProvider: map['resolveProvider'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class DocumentLinkParams {
  TextDocumentIdentifier textDocument;

  DocumentLinkParams({this.textDocument});

  static DocumentLinkParams parse(Map map) {
    return new DocumentLinkParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']));
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson()};
  }
}

class DocumentLink {
  Range range;

  String target;

  DocumentLink({this.range, this.target});

  static DocumentLink parse(Map map) {
    return new DocumentLink(
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        target: map['target']);
  }

  Map<String, dynamic> toJson() {
    return {'range': range?.toJson(), 'target': target};
  }
}

class DocumentLinkRegistrationOptions extends TextDocumentRegistrationOptions {
  bool resolveProvider;

  List<DocumentFilter> documentSelector;

  DocumentLinkRegistrationOptions(
      {this.resolveProvider, this.documentSelector});

  static DocumentLinkRegistrationOptions parse(Map map) {
    return new DocumentLinkRegistrationOptions(
        resolveProvider: map['resolveProvider'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'resolveProvider': resolveProvider,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class DocumentFormattingParams {
  TextDocumentIdentifier textDocument;

  Map<String, String> options;

  DocumentFormattingParams({this.textDocument, this.options});

  static DocumentFormattingParams parse(Map map) {
    return new DocumentFormattingParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        options: map['options']);
  }

  Map<String, dynamic> toJson() {
    return {'textDocument': textDocument?.toJson(), 'options': options};
  }
}

class DocumentRangeFormattingParams {
  TextDocumentIdentifier textDocument;

  Range range;

  Map<String, String> options;

  DocumentRangeFormattingParams({this.textDocument, this.range, this.options});

  static DocumentRangeFormattingParams parse(Map map) {
    return new DocumentRangeFormattingParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        range: map['range'] is! Map ? null : Range.parse(map['range']),
        options: map['options']);
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'range': range?.toJson(),
      'options': options
    };
  }
}

class DocumentOnTypeFormattingParams {
  TextDocumentIdentifier textDocument;

  Position position;

  String ch;

  Map<String, String> options;

  DocumentOnTypeFormattingParams(
      {this.textDocument, this.position, this.ch, this.options});

  static DocumentOnTypeFormattingParams parse(Map map) {
    return new DocumentOnTypeFormattingParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        position:
            map['position'] is! Map ? null : Position.parse(map['position']),
        ch: map['ch'],
        options: map['options']);
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'position': position?.toJson(),
      'ch': ch,
      'options': options
    };
  }
}

class DocumentOnTypeFormattingRegistrationOptions
    extends TextDocumentRegistrationOptions {
  String firstTriggerCharacter;

  List<String> moreTriggerCharacter;

  List<DocumentFilter> documentSelector;

  DocumentOnTypeFormattingRegistrationOptions(
      {this.firstTriggerCharacter,
      this.moreTriggerCharacter,
      this.documentSelector});

  static DocumentOnTypeFormattingRegistrationOptions parse(Map map) {
    return new DocumentOnTypeFormattingRegistrationOptions(
        firstTriggerCharacter: map['firstTriggerCharacter'],
        moreTriggerCharacter: map['moreTriggerCharacter'],
        documentSelector: map['documentSelector'] is! Iterable
            ? null
            : map['documentSelector']
                .map<DocumentFilter>(DocumentFilter.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'firstTriggerCharacter': firstTriggerCharacter,
      'moreTriggerCharacter': moreTriggerCharacter,
      'documentSelector': documentSelector?.map((x) => x.toJson())
    };
  }
}

class RenameParams {
  TextDocumentIdentifier textDocument;

  Position position;

  String newName;

  RenameParams({this.textDocument, this.position, this.newName});

  static RenameParams parse(Map map) {
    return new RenameParams(
        textDocument: map['textDocument'] is! Map
            ? null
            : TextDocumentIdentifier.parse(map['textDocument']),
        position:
            map['position'] is! Map ? null : Position.parse(map['position']),
        newName: map['newName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument?.toJson(),
      'position': position?.toJson(),
      'newName': newName
    };
  }
}

class ExecuteCommandParams {
  String command;

  List<dynamic> arguments;

  ExecuteCommandParams({this.command, this.arguments});

  static ExecuteCommandParams parse(Map map) {
    return new ExecuteCommandParams(
        command: map['command'], arguments: map['arguments']);
  }

  Map<String, dynamic> toJson() {
    return {'command': command, 'arguments': arguments};
  }
}

class ExecuteCommandRegistrationOptions {
  List<String> commands;

  ExecuteCommandRegistrationOptions({this.commands});

  static ExecuteCommandRegistrationOptions parse(Map map) {
    return new ExecuteCommandRegistrationOptions(commands: map['commands']);
  }

  Map<String, dynamic> toJson() {
    return {'commands': commands};
  }
}

class ApplyWorkspaceEditParams {
  WorkspaceEdit edit;

  ApplyWorkspaceEditParams({this.edit});

  static ApplyWorkspaceEditParams parse(Map map) {
    return new ApplyWorkspaceEditParams(
        edit: map['edit'] is! Map ? null : WorkspaceEdit.parse(map['edit']));
  }

  Map<String, dynamic> toJson() {
    return {'edit': edit?.toJson()};
  }
}

class ApplyWorkspaceEditResponse {
  bool applied;

  ApplyWorkspaceEditResponse({this.applied});

  static ApplyWorkspaceEditResponse parse(Map map) {
    return new ApplyWorkspaceEditResponse(applied: map['applied']);
  }

  Map<String, dynamic> toJson() {
    return {'applied': applied};
  }
}

abstract class ErrorCodes {
  // Defined by JSON RPC
  static const num ParseError = -32700;

  static const num InvalidRequest = -32600;

  static const num MethodNotFound = -32601;

  static const num InvalidParams = -32602;

  static const num InternalError = -32603;

  static const num serverErrorStart = -32099;

  static const num serverErrorEnd = -32000;

  static const num ServerNotInitialized = -32002;

  static const num UnknownErrorCode = -32001;

  // Defined by the protocol.
  static const num RequestCancelled = -32800;
}

abstract class DiagnosticSeverity {
  /**
	 * Reports an error.
	 */
  static const num Error = 1;

  /**
	 * Reports a warning.
	 */
  static const num Warning = 2;

  /**
	 * Reports an information.
	 */
  static const num Information = 3;

  /**
	 * Reports a hint.
	 */
  static const num Hint = 4;
}

/**
 * Known error codes for an `InitializeError`;
 */
abstract class InitializeErrorCode {
  /**
	 * If the protocol version provided by the client can't be handled by the server.
	 * @deprecated This initialize error got replaced by client capabilities. There is
	 * no version handshake in version 3.0x
	 */
  static const num unknownProtocolVersion = 1;
}

/**
 * Defines how the host (editor) should sync document changes to the language server.
 */
abstract class TextDocumentSyncKind {
  /**
	 * Documents should not be synced at all.
	 */
  static const num None = 0;

  /**
	 * Documents are synced by always sending the full content
	 * of the document.
	 */
  static const num Full = 1;

  /**
	 * Documents are synced by sending the full content on open.
	 * After that only incremental updates to the document are
	 * send.
	 */
  static const num Incremental = 2;
}

abstract class MessageType {
  /**
	 * An error message.
	 */
  static const num Error = 1;

  /**
	 * A warning message.
	 */
  static const num Warning = 2;

  /**
	 * An information message.
	 */
  static const num Info = 3;

  /**
	 * A log message.
	 */
  static const num Log = 4;
}

/**
 * Represents reasons why a text document is saved.
 */
abstract class TextDocumentSaveReason {
  /**
	 * Manually triggered, e.g. by the user pressing save, by starting debugging,
	 * or by an API call.
	 */
  static const num Manual = 1;

  /**
	 * Automatic after a delay.
	 */
  static const num AfterDelay = 2;

  /**
	 * When the editor lost focus.
	 */
  static const num FocusOut = 3;
}

/**
 * The file event type.
 */
abstract class FileChangeType {
  /**
	 * The file got created.
	 */
  static const num Created = 1;

  /**
	 * The file got changed.
	 */
  static const num Changed = 2;

  /**
	 * The file got deleted.
	 */
  static const num Deleted = 3;
}

/**
 * Defines whether the insert text in a completion item should be interpreted as
 * plain text or a snippet.
 */
abstract class InsertTextFormatType {
  /**
	 * The primary text to be inserted is treated as a plain string.
	 */
  static const num PlainText = 1;

  /**
	 * The primary text to be inserted is treated as a snippet.
	 *
	 * A snippet can define tab stops and placeholders with `$1`, `$2`
	 * and `${3:foo}`. `$0` defines the final tab stop, it defaults to
	 * the end of the snippet. Placeholders with equal identifiers are linked,
	 * that is typing in one will update others too.
	 *
	 * See also: https://github.com/Microsoft/vscode/blob/master/src/vs/editor/contrib/snippet/common/snippet.md
	 */
  static const num Snippet = 2;
}

/**
 * The kind of a completion entry.
 */
abstract class CompletionItemKind {
  static const num Text = 1;

  static const num Method = 2;

  static const num Function = 3;

  static const num Constructor = 4;

  static const num Field = 5;

  static const num Variable = 6;

  static const num Class = 7;

  static const num Interface = 8;

  static const num Module = 9;

  static const num Property = 10;

  static const num Unit = 11;

  static const num Value = 12;

  static const num Enum = 13;

  static const num Keyword = 14;

  static const num Snippet = 15;

  static const num Color = 16;

  static const num File = 17;

  static const num Reference = 18;
}

/**
 * A document highlight kind.
 */
abstract class DocumentHighlightKind {
  /**
	 * A textual occurrence.
	 */
  static const num Text = 1;

  /**
	 * Read-access of a symbol, like reading a variable.
	 */
  static const num Read = 2;

  /**
	 * Write-access of a symbol, like writing to a variable.
	 */
  static const num Write = 3;
}

/**
 * A symbol kind.
 */
abstract class SymbolKind {
  static const num File = 1;

  static const num Module = 2;

  static const num Namespace = 3;

  static const num Package = 4;

  static const num Class = 5;

  static const num Method = 6;

  static const num Property = 7;

  static const num Field = 8;

  static const num Constructor = 9;

  static const num Enum = 10;

  static const num Interface = 11;

  static const num Function = 12;

  static const num Variable = 13;

  static const num Constant = 14;

  static const num String = 15;

  static const num Number = 16;

  static const num Boolean = 17;

  static const num Array = 18;
}

class WorkspaceClientCapabilitiesWorkspaceEdit {
  /**
		 * The client supports versioned document changes in `WorkspaceEdit`s
		 */
  bool documentChanges;

  WorkspaceClientCapabilitiesWorkspaceEdit({this.documentChanges});

  static WorkspaceClientCapabilitiesWorkspaceEdit parse(Map map) {
    return new WorkspaceClientCapabilitiesWorkspaceEdit(
        documentChanges: map['documentChanges']);
  }

  Map<String, dynamic> toJson() {
    return {'documentChanges': documentChanges};
  }
}

class WorkspaceClientCapabilitiesDidChangeConfiguration {
  /**
		 * Did change configuration notification supports dynamic registration.
		 */
  bool dynamicRegistration;

  WorkspaceClientCapabilitiesDidChangeConfiguration({this.dynamicRegistration});

  static WorkspaceClientCapabilitiesDidChangeConfiguration parse(Map map) {
    return new WorkspaceClientCapabilitiesDidChangeConfiguration(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class WorkspaceClientCapabilitiesDidChangeWatchedFiles {
  /**
		 * Did change watched files notification supports dynamic registration.
		 */
  bool dynamicRegistration;

  WorkspaceClientCapabilitiesDidChangeWatchedFiles({this.dynamicRegistration});

  static WorkspaceClientCapabilitiesDidChangeWatchedFiles parse(Map map) {
    return new WorkspaceClientCapabilitiesDidChangeWatchedFiles(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class WorkspaceClientCapabilitiesSymbol {
  /**
		 * Symbol request supports dynamic registration.
		 */
  bool dynamicRegistration;

  WorkspaceClientCapabilitiesSymbol({this.dynamicRegistration});

  static WorkspaceClientCapabilitiesSymbol parse(Map map) {
    return new WorkspaceClientCapabilitiesSymbol(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class WorkspaceClientCapabilitiesExecuteCommand {
  /**
		 * Execute command supports dynamic registration.
		 */
  bool dynamicRegistration;

  WorkspaceClientCapabilitiesExecuteCommand({this.dynamicRegistration});

  static WorkspaceClientCapabilitiesExecuteCommand parse(Map map) {
    return new WorkspaceClientCapabilitiesExecuteCommand(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesSynchronization {
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

  TextDocumentClientCapabilitiesSynchronization(
      {this.dynamicRegistration,
      this.willSave,
      this.willSaveWaitUntil,
      this.didSave});

  static TextDocumentClientCapabilitiesSynchronization parse(Map map) {
    return new TextDocumentClientCapabilitiesSynchronization(
        dynamicRegistration: map['dynamicRegistration'],
        willSave: map['willSave'],
        willSaveWaitUntil: map['willSaveWaitUntil'],
        didSave: map['didSave']);
  }

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'willSave': willSave,
      'willSaveWaitUntil': willSaveWaitUntil,
      'didSave': didSave
    };
  }
}

class TextDocumentClientCapabilitiesCompletion {
  /**
		 * Whether completion supports dynamic registration.
		 */
  bool dynamicRegistration;

  /**
		 * The client supports the following `CompletionItem` specific
		 * capabilities.
		 */
  TextDocumentClientCapabilitiesCompletionCompletionItem completionItem;

  TextDocumentClientCapabilitiesCompletion(
      {this.dynamicRegistration, this.completionItem});

  static TextDocumentClientCapabilitiesCompletion parse(Map map) {
    return new TextDocumentClientCapabilitiesCompletion(
        dynamicRegistration: map['dynamicRegistration'],
        completionItem: map['completionItem'] is! Map
            ? null
            : TextDocumentClientCapabilitiesCompletionCompletionItem
                .parse(map['completionItem']));
  }

  Map<String, dynamic> toJson() {
    return {
      'dynamicRegistration': dynamicRegistration,
      'completionItem': completionItem?.toJson()
    };
  }
}

class TextDocumentClientCapabilitiesCompletionCompletionItem {
  /**
			 * Client supports snippets as insert text.
			 *
			 * A snippet can define tab stops and placeholders with `$1`, `$2`
			 * and `${3:foo}`. `$0` defines the final tab stop, it defaults to
			 * the end of the snippet. Placeholders with equal identifiers are linked,
			 * that is typing in one will update others too.
			 */
  bool snippetSupport;

  TextDocumentClientCapabilitiesCompletionCompletionItem({this.snippetSupport});

  static TextDocumentClientCapabilitiesCompletionCompletionItem parse(Map map) {
    return new TextDocumentClientCapabilitiesCompletionCompletionItem(
        snippetSupport: map['snippetSupport']);
  }

  Map<String, dynamic> toJson() {
    return {'snippetSupport': snippetSupport};
  }
}

class TextDocumentClientCapabilitiesHover {
  /**
		 * Whether hover supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesHover({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesHover parse(Map map) {
    return new TextDocumentClientCapabilitiesHover(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesSignatureHelp {
  /**
		 * Whether signature help supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesSignatureHelp({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesSignatureHelp parse(Map map) {
    return new TextDocumentClientCapabilitiesSignatureHelp(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesReferences {
  /**
		 * Whether references supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesReferences({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesReferences parse(Map map) {
    return new TextDocumentClientCapabilitiesReferences(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesDocumentHighlight {
  /**
		 * Whether document highlight supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesDocumentHighlight({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesDocumentHighlight parse(Map map) {
    return new TextDocumentClientCapabilitiesDocumentHighlight(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesDocumentSymbol {
  /**
		 * Whether document symbol supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesDocumentSymbol({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesDocumentSymbol parse(Map map) {
    return new TextDocumentClientCapabilitiesDocumentSymbol(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesFormatting {
  /**
		 * Whether formatting supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesFormatting({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesFormatting parse(Map map) {
    return new TextDocumentClientCapabilitiesFormatting(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesRangeFormatting {
  /**
		 * Whether range formatting supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesRangeFormatting({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesRangeFormatting parse(Map map) {
    return new TextDocumentClientCapabilitiesRangeFormatting(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesOnTypeFormatting {
  /**
		 * Whether on type formatting supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesOnTypeFormatting({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesOnTypeFormatting parse(Map map) {
    return new TextDocumentClientCapabilitiesOnTypeFormatting(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesDefinition {
  /**
		 * Whether definition supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesDefinition({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesDefinition parse(Map map) {
    return new TextDocumentClientCapabilitiesDefinition(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesCodeAction {
  /**
		 * Whether code action supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesCodeAction({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesCodeAction parse(Map map) {
    return new TextDocumentClientCapabilitiesCodeAction(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesCodeLens {
  /**
		 * Whether code lens supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesCodeLens({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesCodeLens parse(Map map) {
    return new TextDocumentClientCapabilitiesCodeLens(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesDocumentLink {
  /**
		 * Whether document link supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesDocumentLink({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesDocumentLink parse(Map map) {
    return new TextDocumentClientCapabilitiesDocumentLink(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

class TextDocumentClientCapabilitiesRename {
  /**
		 * Whether rename supports dynamic registration.
		 */
  bool dynamicRegistration;

  TextDocumentClientCapabilitiesRename({this.dynamicRegistration});

  static TextDocumentClientCapabilitiesRename parse(Map map) {
    return new TextDocumentClientCapabilitiesRename(
        dynamicRegistration: map['dynamicRegistration']);
  }

  Map<String, dynamic> toJson() {
    return {'dynamicRegistration': dynamicRegistration};
  }
}

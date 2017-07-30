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
  dynamic textDocument;

  List<TextEdit> edits;

  TextDocumentEdit({this.textDocument, this.edits});

  static TextDocumentEdit parse(Map map) {
    return new TextDocumentEdit(
        textDocument: map['textDocument'],
        edits: map['edits'] is! Iterable
            ? null
            : map['edits'].map<TextEdit>(TextEdit.parse).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument,
      'edits': edits?.map((x) => x.toJson())
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
  dynamic processId;

  dynamic rootPath;

  dynamic rootUri;

  dynamic initializationOptions;

  ClientCapabilities capabilities;

  dynamic trace;

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

class ClientCapabilities {
  dynamic workspace;

  dynamic textDocument;

  dynamic experimental;

  ClientCapabilities({this.workspace, this.textDocument, this.experimental});

  static ClientCapabilities parse(Map map) {
    return new ClientCapabilities(
        workspace: map['workspace'],
        textDocument: map['textDocument'],
        experimental: map['experimental']);
  }

  Map<String, dynamic> toJson() {
    return {
      'workspace': workspace,
      'textDocument': textDocument,
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
  dynamic textDocument;

  List<TextDocumentContentChangeEvent> contentChanges;

  DidChangeTextDocumentParams({this.textDocument, this.contentChanges});

  static DidChangeTextDocumentParams parse(Map map) {
    return new DidChangeTextDocumentParams(
        textDocument: map['textDocument'],
        contentChanges: map['contentChanges'] is! Iterable
            ? null
            : map['contentChanges']
                .map<TextDocumentContentChangeEvent>(
                    TextDocumentContentChangeEvent.parse)
                .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'textDocument': textDocument,
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

  InsertTextFormat insertTextFormat;

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

class DocumentFormattingParams {
  TextDocumentIdentifier textDocument;

  dynamic options;

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

  dynamic options;

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

  dynamic options;

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
  dynamic edit;

  ApplyWorkspaceEditParams({this.edit});

  static ApplyWorkspaceEditParams parse(Map map) {
    return new ApplyWorkspaceEditParams(edit: map['edit']);
  }

  Map<String, dynamic> toJson() {
    return {'edit': edit};
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
abstract class InsertTextFormat {
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

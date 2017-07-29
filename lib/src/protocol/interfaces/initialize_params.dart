import 'package:owl/annotation/json.dart';
import 'client_capabilities.dart';

@JsonClass()
class InitializeParams {
  /**
   * The process Id of the parent process that started
   * the server. Is `null` if the process has not been started by another process.
   * If the parent process is not alive then the server should exit (see exit notification) its process.
   */
  num processId;

  /**
   * The rootPath of the workspace. Is `null`
   * if no folder is open.
   *
   * Deprecated in favour of rootUri.
   */
  @deprecated
  String rootPath;

  /**
   * The rootUri of the workspace. Is `null` if no
   * folder is open. If both `rootPath` and `rootUri` are set
   * `rootUri` wins.
   */
  String rootUri;

  /**
   * User provided initialization options.
   */
  dynamic initializationOptions;

  /**
   * The capabilities provided by the client (editor or tool)
   */
  ClientCapabilities capabilities;

  /**
   * The initial trace setting. If omitted trace is disabled ('off').
   */
  String trace;
}

/// Constants for LSP trace settings.
abstract class TraceSetting {
  static const String off = 'off', messages = 'messages', verbose = 'verbose';
}

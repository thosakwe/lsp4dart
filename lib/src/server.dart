import 'dart:async';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
import 'package:meta/meta.dart';
import 'package:stream_channel/stream_channel.dart';
import 'protocol/interfaces/interfaces.dart';

/// Implements the server side of the Language Server Protocol.
abstract class Server {
  @mustCallSuper
  void listen(StreamChannel<String> channel) {
    var server = new json_rpc.Server(channel);
    _configure(server);
    server.listen();
  }

  void _configure(json_rpc.Server server) {
    server.registerMethod('initialize', (json_rpc.Parameters params) {
      var initializeParams = InitializeParams.parse(params.asMap);
      return new Future<InitializeResult>.sync(
          () => initialize(initializeParams)).then((r) => r.toJson());
    });
  }

  /// The initialize request is sent as the first request from the client to the server.
  ///
  /// If the server receives request or notification before the `initialize` request it should act as follows:
  /// for a request the respond should be errored with code: -32002. The message can be picked by the server.
  /// notifications should be dropped, except for the exit notification. This will allow the exit a server without an `initialize` request.
  ///
  /// Until the server has responded to the `initialize` request with an `InitializeResult` the client must not sent any additional requests or notifications to the server.
  FutureOr<InitializeResult> initialize(InitializeParams params);
}

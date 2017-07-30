import 'dart:async';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
import 'package:stream_channel/stream_channel.dart';
import 'protocol/interfaces/interfaces.dart';

class Client {
  json_rpc.Client _client;
  final StreamChannel<String> channel;

  Client(this.channel) {
    _client = new json_rpc.Client(channel);
    _client.listen();
  }

  Future<InitializeResult> initialize(InitializeParams initializeParams) {
    return _client
        .sendRequest('initialize', initializeParams.toJson())
        .then<InitializeResult>(InitializeResult.parse);
  }
}

import 'dart:async';
import 'package:json_god/json_god.dart' as god;
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

  Future<InitializeResultOrError> initialize(
      InitializeParams initializeParams) async {
    var response = await _client.sendRequest(
        'initialize', god.serializeObject(initializeParams));
    print(response);
  }
}

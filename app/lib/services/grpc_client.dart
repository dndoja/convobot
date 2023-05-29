import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';

import 'package:common/common.dart';

class GrpcClient {
  const GrpcClient._(this._client, this._channel);
  final ConversationClient _client;
  final ClientChannel _channel;

  factory GrpcClient.get() {
    final Uri serviceUri = Uri.parse(dotenv.env['GRPC_SERVICE_URL']!);

    final ClientChannel channel = ClientChannel(
      serviceUri.host,
      port: serviceUri.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final ConversationClient client = ConversationClient(
      channel,
      options: CallOptions(timeout: const Duration(seconds: 30)),
    );

    return GrpcClient._(client, channel);
  }

  Stream<ConversationMessage> subscribeToConversation(
    Stream<ConversationMessage> audioMessagesStream,
  ) =>
      _client.converse(audioMessagesStream);

  void dispose() => _channel.shutdown();
}

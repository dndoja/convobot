import 'package:common/models/models.dart';
import 'package:edge_http_client/edge_http_client.dart';
import 'package:openai_client/openai_client.dart';
// ignore: implementation_imports
import 'package:openai_client/src/model/openai_chat/chat_message.dart';

import 'package:supabase_functions/supabase_functions.dart';

late final OpenAIClient _client;

void initializeOpenAI(EdgeHttpClient? edgeClient) => _client = OpenAIClient(
      configuration: OpenAIConfiguration(apiKey: Deno.env.get('OPENAI_KEY')!),
      httpClient: edgeClient,
    );

Future<ConversationMessage> fetchNextMessageInConversation(
  Iterable<ConversationMessage> conversation,
) =>
    _client.chat
        .create(
          model: "gpt-3.5-turbo",
          messages: conversation
              .map(
                (m) => ChatMessage(
                  role: m.sender.openAiMessageRole,
                  content: m.text,
                ),
              )
              .toList(),
        )
        .data
        .then(
          (r) => ConversationMessage(
            sender: MessageSender.ai,
            text: r.choices.map((c) => c.message.content).join('\n'),
            timestamp: DateTime.now().toUtc(),
          ),
        );

extension on MessageSender {
  String get openAiMessageRole {
    switch (this) {
      case MessageSender.ai:
        return 'assistant';
      case MessageSender.user:
        return 'user';
      case MessageSender.narrator:
        return 'system';
    }
  }
}

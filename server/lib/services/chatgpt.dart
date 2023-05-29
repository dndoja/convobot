import 'package:common/models/models.dart';
import 'package:openai_client/openai_client.dart';
// ignore: implementation_imports
import 'package:openai_client/src/model/openai_chat/chat_message.dart';
import 'package:server/services/secrets.dart';

late final OpenAIClient _client;

void initializeOpenAI() => _client = OpenAIClient(
      configuration: OpenAIConfiguration(apiKey: Secrets.get().openAiKey),
    );

Future<ConversationMessage> sendMessagesToChatGPT(
  Iterable<ConversationMessage> messages,
) =>
    _client.chat
        .create(
          model: "gpt-3.5-turbo",
          messages: messages
              .map(
                (m) => ChatMessage(
                  role: m.author.openAiMessageRole,
                  content: m.text,
                ),
              )
              .toList(),
        )
        .data
        .then(
          (r) => ConversationMessage(
            author: MessageAuthor.ai,
            text: r.choices.map((c) => c.message.content).join('\n'),
          ),
        );

extension on MessageAuthor {
  String get openAiMessageRole {
    switch (this) {
      case MessageAuthor.ai:
        return 'assistant';
      case MessageAuthor.user:
        return 'user';
      case MessageAuthor.narrator:
        return 'system';
      default:
        throw Exception('You should have never come here!');
    }
  }
}

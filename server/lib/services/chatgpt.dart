import 'package:common/models/models.dart';
import 'package:dart_openai/openai.dart';
import 'package:supabase_functions/supabase_functions.dart';

void initializeOpenAI() => OpenAI.apiKey = Deno.env.get('OPENAI_KEY')!;

Future<ConversationMessage> fetchNextMessageInConversation(
  Iterable<ConversationMessage> conversation,
) =>
    OpenAI.instance.chat
        .create(
          model: "gpt-3.5-turbo",
          messages: conversation
              .map(
                (m) => OpenAIChatCompletionChoiceMessageModel(
                  role: m.sender.openAiMessageRole,
                  content: m.text,
                ),
              )
              .toList(),
        )
        .then(
          (r) => ConversationMessage(
            sender: MessageSender.ai,
            text: r.choices.map((c) => c.message.content).join('\n'),
            timestamp: DateTime.now().toUtc(),
          ),
        );

extension on MessageSender {
  OpenAIChatMessageRole get openAiMessageRole {
    switch (this) {
      case MessageSender.ai:
        return OpenAIChatMessageRole.assistant;
      case MessageSender.user:
        return OpenAIChatMessageRole.user;
      case MessageSender.narrator:
        return OpenAIChatMessageRole.system;
    }
  }
}

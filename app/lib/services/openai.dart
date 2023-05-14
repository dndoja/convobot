import 'package:dart_openai/openai.dart';

final List<OpenAIChatCompletionChoiceMessageModel> _setupMessages = [
  const OpenAIChatCompletionChoiceMessageModel(
    content: 'You are a very friendly stranger who speaks french',
    role: OpenAIChatMessageRole.system,
  ),
  const OpenAIChatCompletionChoiceMessageModel(
    content: 'Can we have a conversation in french so I can practice',
    role: OpenAIChatMessageRole.user,
  ),
];

class ChatGptConversationEngine {
  ChatGptConversationEngine();

  final List<OpenAIChatCompletionChoiceMessageModel> _messageHistory = [
    ..._setupMessages,
  ];

  Future<String> sendMessage(String message) async {
    _messageHistory.add(
      OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.user,
        content: message,
      ),
    );

    final OpenAIChatCompletionModel reply = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        ..._messageHistory,
        OpenAIChatCompletionChoiceMessageModel(
          content: message,
          role: OpenAIChatMessageRole.user,
        )
      ],
    );

    final String replyMessage =
        reply.choices.map((c) => c.message.content).join('\n');
    _messageHistory.add(
      OpenAIChatCompletionChoiceMessageModel(
        role: OpenAIChatMessageRole.assistant,
        content: replyMessage,
      ),
    );

    return replyMessage;
  }
}

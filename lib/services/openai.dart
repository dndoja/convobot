import 'package:dart_openai/openai.dart';
export 'package:dart_openai/openai.dart';

Future<OpenAIChatCompletionModel> sendChatGptMessage(String message) =>
    OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: message,
          role: OpenAIChatMessageRole.user,
        )
      ],
    );

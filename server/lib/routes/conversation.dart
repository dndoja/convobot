import 'dart:convert';

import 'package:grpc/grpc.dart' as grpc;

import 'package:common/common.dart';
import 'package:server/services/services.dart';

final List<ConversationMessage> _setupMessages = [
  ConversationMessage(
    text: 'You are a very friendly stranger',
    author: MessageAuthor.narrator,
  ),
  // ConversationMessage(
  //   text: 'Can we have a conversation in french so I can practice',
  //   author: MessageAuthor.user,
  // ),
];

class ConversationService extends ConversationServiceBase {
  @override
  Stream<ConversationMessage> converse(
    grpc.ServiceCall call,
    Stream<ConversationMessage> request,
  ) async* {
    final Stream<ConversationMessage?> transcriptedMessages =
        generateTextFromSpeech(
      request.map((m) => m.audio).where((audio) => audio.isNotEmpty),
    ).map(
      (response) => response.results.isNotEmpty &&
              response.results.first.alternatives.isNotEmpty
          ? ConversationMessage(
              author: MessageAuthor.user,
              isPartial: !response.results.first.isFinal,
              text: response.results.first.alternatives.first.transcript,
              timestamp: DateTime.now().millisecondsSinceEpoch,
            )
          : null,
    );

    final List<ConversationMessage> messageHistory = [..._setupMessages];

    await for (final transcript in transcriptedMessages) {
      if (transcript == null) continue;

      yield transcript;

      if (transcript.isPartial) continue;

      messageHistory.add(transcript);

      final ConversationMessage chatGptResponse =
          await sendMessagesToChatGPT(messageHistory);

      final String? speechBase64 =
          await generateSpeechFromText(chatGptResponse.text);
      if (speechBase64 != null) {
        chatGptResponse.audio = base64Decode(speechBase64);
      }

      yield chatGptResponse;
    }
  }
}

import 'dart:convert';

import 'package:supabase_functions/supabase_functions.dart';
import 'package:common/common.dart';
import 'package:server/services/services.dart';

FutureOr<Response> getConversationResponse(Request request) async {
  final json = await request.json() as Map<String, dynamic>;
  final List<ConversationMessage> messages = listValueFromJson(
        json['messages'],
        value: (v) => ConversationMessage.fromJson(v),
      ) ??
      [];
  if (messages.isEmpty) return Response('Bad request!', status: 400);

  final ConversationMessage aiResponse = await sendMessagesToChatGPT(messages);

  /// .mp3 encoded in base64
  final String? responseAudio = await generateSpeechFromText(aiResponse.text);

  return Response(
    jsonEncode(
      ConversationResponse(
        message: aiResponse,
        messageAudio: responseAudio,
      ).toJson(),
    ),
  );
}

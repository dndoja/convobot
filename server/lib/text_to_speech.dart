import 'package:googleapis/texttospeech/v1.dart';

import 'package:functions_framework/functions_framework.dart';
import 'package:server/auth.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Future<Response> generateSpeech(Request request) async {
  final String? text = request.url.queryParameters['text'];
  if (text == null) return Response.badRequest();

  final SynthesizeSpeechResponse response = await TexttospeechApi(
    await getAuthClient([TexttospeechApi.cloudPlatformScope]),
  ).text.synthesize(SynthesizeSpeechRequest(
        audioConfig: AudioConfig(audioEncoding: 'mp3'),
        input: SynthesisInput(text: text),
        voice: VoiceSelectionParams(
          languageCode: 'en-US',
          name: 'en-US-Neural2-F',
          ssmlGender: 'FEMALE',
        ),
      ));

  return Response.ok(response.audioContent);
}

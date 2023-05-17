import 'package:googleapis/texttospeech/v1.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:supabase_functions/supabase_functions.dart';

late AuthClient _client;

const List<String> _scopes = [TexttospeechApi.cloudPlatformScope];

void initializeGCloud() async {
  _client = await clientViaServiceAccount(
    ServiceAccountCredentials(
      Deno.env.get('GCLOUD_SERVICE_EMAIL')!,
      ClientId.serviceAccount(Deno.env.get('GCLOUD_CLIENT_ID')!),
      Deno.env.get('GCLOUD_SERVICE_KEY')!,
    ),
    _scopes,
  );
}

Future<String?> generateSpeechFromText(String text) async =>
    await TexttospeechApi(_client)
        .text
        .synthesize(
          SynthesizeSpeechRequest(
            audioConfig: AudioConfig(audioEncoding: 'mp3'),
            input: SynthesisInput(text: text),
            voice: VoiceSelectionParams(
              languageCode: 'en-US',
              name: 'en-US-Neural2-F',
              ssmlGender: 'FEMALE',
            ),
          ),
        )
        .then((response) => response.audioContent);

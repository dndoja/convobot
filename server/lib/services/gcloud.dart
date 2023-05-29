import 'package:googleapis/texttospeech/v1.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:google_speech/google_speech.dart';
import 'package:server/services/secrets.dart';
import 'package:google_speech/generated/google/cloud/speech/v1/cloud_speech.pb.dart'
    show StreamingRecognizeResponse;

late AuthClient _client;

const List<String> _scopes = [TexttospeechApi.cloudPlatformScope];

void initializeGCloud() async {
  _client = await clientViaServiceAccount(
    ServiceAccountCredentials.fromJson(Secrets.get().googleServiceAccount),
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

/// Uses google speech to transcript text from the FLAC encoded audio passed
/// via [rawAudioStream]. Audio language must match [languageCode].
Stream<StreamingRecognizeResponse> generateTextFromSpeech(
  Stream<List<int>> rawAudioStream, {
  String languageCode = 'en',
}) =>
    SpeechToText.viaServiceAccount(
      ServiceAccount.fromString(Secrets.get().googleServiceAccount),
    ).streamingRecognize(
      StreamingRecognitionConfig(
        config: RecognitionConfig(
          sampleRateHertz: 44000,
          encoding: AudioEncoding.LINEAR16,
          languageCode: languageCode,
        ),
        interimResults: true,
      ),
      rawAudioStream,
    );

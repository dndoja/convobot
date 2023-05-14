import 'package:dart_openai/openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initializeServices() async {
  await dotenv.load();

  OpenAI.apiKey = dotenv.env['OPENAI_KEY']!;
}

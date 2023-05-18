import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'apis.dart';

Future<void> initializeServices() async {
  await dotenv.load();
  initializeApiClient();
}

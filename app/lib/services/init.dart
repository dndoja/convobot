import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'apis.dart';
import 'supabase.dart';

Future<void> initializeServices() async {
  await dotenv.load();
  await initializeSupabase();
  initializeApiClient();
}

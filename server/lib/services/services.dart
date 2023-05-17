import 'chatgpt.dart';
import 'gcloud.dart';
import 'supabase.dart';

export 'chatgpt.dart';
export 'gcloud.dart';
export 'supabase.dart';

bool _initialized = false;

void initializeServices() {
  if (_initialized) return;

  initializeGCloud();
  initializeOpenAI();
  initializeSupabase();
}

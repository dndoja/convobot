import 'package:edge_http_client/edge_http_client.dart';

import 'chatgpt.dart';
import 'gcloud.dart';
import 'supabase.dart';

export 'chatgpt.dart';
export 'gcloud.dart';
export 'supabase.dart';

bool _initialized = false;

void initializeServices() {
  if (_initialized) return;

  final EdgeHttpClient edgeHttpClient = EdgeHttpClient();
  initializeGCloud(edgeHttpClient);
  initializeOpenAI(edgeHttpClient);
  initializeSupabase(edgeHttpClient);
}

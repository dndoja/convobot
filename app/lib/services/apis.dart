import 'package:common/models/models.dart';
import 'package:http/http.dart' as http;

import 'supabase.dart';

late final ApiClient apiClient;

void initializeApiClient([ApiClient? client]) => apiClient = client ??
    ApiClient(
      httpClient: http.Client(),
      supabaseClient: supabase,
    );

class ApiClient {
  const ApiClient({
    required this.httpClient,
    required this.supabaseClient,
  });
  final http.Client httpClient;
  final SupabaseClient supabaseClient;

  Future<ConversationResponse?> getConversationResponse(
    List<ConversationMessage> messages,
  ) async {
    try {
      final FunctionResponse response = await supabaseClient.functions.invoke(
        'dart_edge/getConversationResponse',
        body: {'messages': messages.map((m) => m.toJson()).toList()},
      );

      return ConversationResponse.fromJson(response.data);
    } catch (x) {
      return null;
    }
  }
}

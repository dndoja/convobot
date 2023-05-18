import 'dart:convert';
import 'package:common/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String get _edgeFunctionsUrl => dotenv.env['FUNCTIONS_URL']!;

late final ApiClient apiClient;

void initializeApiClient([ApiClient? client]) =>
    apiClient = client ?? ApiClient(http.Client());

class ApiClient {
  const ApiClient(this.client);
  final http.Client client;

  Future<ConversationResponse?> getConversationResponse(
    List<ConversationMessage> messages,
  ) async {
    try {
      final http.Response response = await client.callEdgeFunction(
        'getConversationResponse',
        body: {'messages': messages.map((m) => m.toJson()).toList()},
      );

      return ConversationResponse.fromJson(json.decode(response.body));
    } catch (x) {
      return null;
    }
  }
}

extension on http.Client {
  Future<http.Response> callEdgeFunction(
    String functionName, {
    Map<String, dynamic>? body,
  }) =>
      post(
        Uri.parse('$_edgeFunctionsUrl/$functionName'),
        body: body != null ? json.encode(body) : null,
        headers: {'Authorization': 'Bearer token'},
      );
}

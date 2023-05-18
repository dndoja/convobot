import 'package:common/models/conversation.dart';
import 'package:convobot/services/apis.dart';

final List<ConversationMessage> _setupMessages = [
  ConversationMessage(
    text: 'You are a very friendly stranger who speaks french',
    sender: MessageSender.narrator,
  ),
  ConversationMessage(
    text: 'Can we have a conversation in french so I can practice',
    sender: MessageSender.user,
  ),
];

class ConversationEngine {
  ConversationEngine();

  final List<ConversationMessage> messageHistory = [..._setupMessages];

  Future<ConversationResponse?> sendMessage(ConversationMessage message) async {
    messageHistory.add(message);

    final response = await apiClient.getConversationResponse(messageHistory);
    if (response == null) return null;

    messageHistory.add(response.message);

    return response;
  }
}

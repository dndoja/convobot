enum MessageSender { ai, user }

class ConversationMessage {
  const ConversationMessage(
    this.text, {
    required this.sender,
    required this.timestamp,
  });
  final MessageSender sender;
  final String text;
  final DateTime timestamp;
}

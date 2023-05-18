import 'package:data_classes/data_classes.dart';

part 'conversation.g.dart';

enum MessageSender { ai, user, narrator }

@data
class _ConversationMessageModel {
  late MessageSender sender;
  late String text;
}

@data
class _ConversationResponseModel {
  late ConversationMessage message;
  String? messageAudio;
}

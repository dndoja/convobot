import 'package:data_classes/data_classes.dart';

part 'message.g.dart';

enum MessageSender { ai, user, narrator }

@data
class _ConversationMessageModel {
  late MessageSender sender;
  late String text;
  late DateTime timestamp;
}

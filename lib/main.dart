import 'package:convobot/ui/screens/conversation.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) => const CupertinoApp(
        title: 'Convobot Demo',
        theme: CupertinoThemeData(
          brightness: Brightness.light,
        ),
        home: ConversationScreen(),
      );
}

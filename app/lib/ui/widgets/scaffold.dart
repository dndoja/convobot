import 'package:flutter/cupertino.dart';

class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    required this.body,
    this.backgroundColor,
    this.title,
    super.key,
  });
  final Widget body;
  final Color? backgroundColor;
  final String? title;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: title != null
            ? CupertinoNavigationBar(
                middle: Text(title!),
              )
            : null,
        child: SafeArea(child: body),
      );
}

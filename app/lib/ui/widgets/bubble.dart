import 'package:flutter/cupertino.dart';
import 'package:common/models/message.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    required this.child,
    this.marginBottom = 2,
    this.sent = false,
    super.key,
  });

  Bubble.fromMessage(
    ConversationMessage message, {
    double marginBottom = 2,
    sent = false,
  }) : this(
          child: Text(
            message.text,
            style: TextStyle(
              color: sent ? CupertinoColors.white : CupertinoColors.black,
            ),
          ),
          marginBottom: marginBottom,
          sent: sent,
        );
  final double marginBottom;
  final Widget child;
  final bool sent;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
          bottom: marginBottom,
          left: sent ? 24 : 16,
          right: sent ? 16 : 24,
        ),
        child: Row(
          mainAxisAlignment:
              sent ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: sent
                      ? CupertinoColors.systemBlue
                      : CupertinoColors.lightBackgroundGray,
                ),
                child: child,
              ),
            ),
          ],
        ),
      );
}

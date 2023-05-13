import 'package:convobot/models/models.dart';
import 'package:convobot/services/openai.dart';
import 'package:convobot/ui/widgets/widgets.dart';
import 'package:convobot/utils/utils.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen();

  @override
  Widget build(BuildContext context) => const ScreenScaffold(body: _Body());
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  late final List<ConversationMessage> _messages;

  bool isWaitingForResponse = false;

  @override
  void initState() {
    super.initState();
    _messages = [];
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: _Chat(_messages)),
          _ResponseField(
            active: !isWaitingForResponse,
            onSubmit: sendMessage,
          ),
        ],
      );

  Future<void> sendMessage(String message) async {
    setState(() {
      isWaitingForResponse = true;
      _messages.add(
        ConversationMessage(
          message,
          sender: MessageSender.user,
          timestamp: DateTime.now(),
        ),
      );
    });

    final response = await sendChatGptMessage(message);
    if (!mounted || response.choices.isEmpty) return;

    setState(
      () {
        isWaitingForResponse = false;
        _messages.addAll(
          response.choices.map(
            (r) => ConversationMessage(
              r.message.content,
              sender: MessageSender.ai,
              timestamp: response.created.toLocal(),
            ),
          ),
        );
      },
    );
  }
}

class _Chat extends StatelessWidget {
  const _Chat(this.messages);
  final List<ConversationMessage> messages;

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          ...messages.mapIndexed((i, message) {
            final bool isLastInStreak = i < messages.lastIndex &&
                messages[i + 1].sender != messages[i].sender;

            return Bubble.fromMessage(
              message,
              marginBottom: isLastInStreak ? 8 : 2,
              sent: messages[i].sender == MessageSender.user,
            );
          })
        ],
      );
}

class _ResponseField extends StatefulWidget {
  const _ResponseField({
    required this.onSubmit,
    this.active = true,
  });

  final bool active;
  final void Function(String) onSubmit;

  @override
  State<_ResponseField> createState() => __ResponseFieldState();
}

class __ResponseFieldState extends State<_ResponseField> {
  late final TextEditingController _controller;

  bool get hasValidInput => _controller.text.isNotBlank;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: CupertinoTextField(
          controller: _controller,
          maxLines: null,
          onSubmitted: (_) => _onSubmit(),
          placeholder: 'Message',
          suffix: GestureDetector(
            onTap: _onSubmit,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Icon(
                CupertinoIcons.arrow_up_circle_fill,
                color: widget.active
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.inactiveGray,
                size: 32,
              ),
            ),
          ),
          textCapitalization: TextCapitalization.sentences,
        ),
      );

  void _onSubmit() {
    if (!hasValidInput || !widget.active) return;

    widget.onSubmit(_controller.text);
    _controller.clear();
  }
}

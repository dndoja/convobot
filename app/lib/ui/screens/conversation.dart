import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soundpool/soundpool.dart';

import 'package:common/models/models.dart';

import 'package:convobot/services/grpc_client.dart';
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
  late final Soundpool _audioPlayer;
  late final FlutterAudioCapture _audioRecorder;
  late final List<ConversationMessage> _messages;
  late final GrpcClient _conversationClient;
  late final StreamController<Uint8List> _audioStreamController =
      StreamController();
  late final TextEditingController _textController;

  final List<Uint8List> _audioBuffer = [];

  bool isWaitingForResponse = false;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = Soundpool.fromOptions();
    _audioRecorder = FlutterAudioCapture();
    _conversationClient = GrpcClient.get();
    _messages = [];
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _conversationClient.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _onMessage(ConversationMessage message) async {
    if (!mounted || message.author == MessageAuthor.narrator) return;

    setState(
      () {
        _messages.add(message);
        if (message.author == MessageAuthor.ai) {
          isWaitingForResponse = false;
        } else {
          _textController.text = message.text;
        }
      },
    );

    if (message.author == MessageAuthor.ai) {
      if (message.audio.isNotEmpty) {
        final int soundId = await _audioPlayer.loadUint8List(
          Uint8List.fromList(message.audio),
        );
        await _audioPlayer.play(soundId);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: _Chat(_messages)),
          _ResponseField(
            active: !isWaitingForResponse,
            controller: _textController,
            onSubmit: (_) {},
          ),
          CupertinoButton(
            child: Text(isRecording ? '...' : 'Record'),
            onPressed: () => isRecording ? recordEnd() : recordStart(),
            color: isRecording
                ? CupertinoColors.activeBlue
                : CupertinoColors.white,
          ),
        ],
      );

  Future<void> recordStart() async {
    await Permission.microphone.request();

    setState(() => isRecording = true);

    _conversationClient
        .subscribeToConversation(
          _audioStreamController.stream.map(
            (s) => ConversationMessage(
              audio: s,
              author: MessageAuthor.user,
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
        )
        .listen(_onMessage);

    await _audioRecorder.start(
      (data) => _audioBuffer
          .add(pcmInt16FromFloat32(Float64List.fromList(data.cast<double>()))),
      // ignore: avoid_print
      print,
      waitForFirstDataOnAndroid: false,
    );
  }

  Future<void> recordEnd() async {
    await _audioRecorder.stop();
    _audioBuffer.forEach(_audioStreamController.add);
    _audioBuffer.clear();
    setState(() => isRecording = false);
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
                messages[i + 1].author != messages[i].author;

            return Bubble.fromMessage(
              message,
              marginBottom: isLastInStreak ? 8 : 2,
              sent: messages[i].author == MessageAuthor.user,
            );
          })
        ],
      );
}

class _ResponseField extends StatefulWidget {
  const _ResponseField({
    this.controller,
    this.onSubmit,
    this.active = true,
  });

  final bool active;
  final TextEditingController? controller;
  final void Function(String)? onSubmit;

  @override
  State<_ResponseField> createState() => __ResponseFieldState();
}

class __ResponseFieldState extends State<_ResponseField> {
  late final TextEditingController _controller;

  bool get hasValidInput => _controller.text.isNotBlank;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
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
          enabled: widget.controller == null,
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
    if (!hasValidInput || !widget.active || widget.onSubmit == null) return;

    widget.onSubmit!(_controller.text);
    _controller.clear();
  }
}

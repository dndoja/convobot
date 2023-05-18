// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// SugarClassesGenerator
// **************************************************************************

/// {@category sugar-class}
class ConversationMessage
    implements
        ICopyable<ConversationMessage, ConversationMessageBaseModel>,
        IEquitable,
        ISerializable {
  factory ConversationMessage({
    required MessageSender sender,
    required String text,
  }) =>
      ConversationMessage._build(
        (b) => b
          ..sender = sender
          ..text = text,
      );

  ConversationMessage._build(
    ModelBuilder<ConversationMessageBaseModel> builder,
  ) {
    builder.call(_model);
  }

  static void _modelCopy(
    ConversationMessageBaseModel source,
    ConversationMessageBaseModel dest,
  ) =>
      dest
        ..sender = source.sender
        ..text = source.text;

  /// Prevents `unused_element` warning for the sealed class definition
  static void _dummy(_ConversationMessageModel _) {}

  factory ConversationMessage._fromModel(
    ConversationMessageBaseModel source,
  ) =>
      ConversationMessage._build((dest) => _modelCopy(source, dest));

  factory ConversationMessage.fromJson(Json json) =>
      ConversationMessage._fromModel(_modelFromJson(json));

  static ConversationMessageBaseModel _modelFromJson(
    Map<dynamic, dynamic> json,
  ) {
    final model = ConversationMessageBaseModel();

    setModelField<MessageSender>(
      json,
      'sender',
      (v) => model.sender = v!,
      getter: (j) => enumValueFromJson(j, MessageSender.values),
      required: true,
    );

    setModelField<String>(
      json,
      'text',
      (v) => model.text = v!,
      required: true,
    );

    return model;
  }

  final ConversationMessageBaseModel _model = ConversationMessageBaseModel();

  MessageSender get sender => _model.sender;
  set sender(MessageSender value) => _model.sender = value;
  String get text => _model.text;
  set text(String value) => _model.text = value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationMessage &&
          eqDeep(
            _model.sender,
            other._model.sender,
          ) &&
          eqDeep(
            _model.text,
            other._model.text,
          );

  /// This hash code compatible with [operator ==].
  /// [ConversationMessage] classes with the same data
  /// have the same hash code.
  @override
  int get hashCode => hashList([
        sender,
        text,
      ]);

  /// Converts this [ConversationMessage] into a [String].
  @override
  String toString() => 'ConversationMessage(\n'
      '  sender: $sender\n'
      '  text: $text\n'
      ')';

  factory ConversationMessage.from(
    ConversationMessage source,
  ) =>
      ConversationMessage._build(
        (destModel) => _modelCopy(source._model, destModel),
      );

  /// Creates a new instance of [ConversationMessage],
  /// which is a copy of this with some changes
  @override
  ConversationMessage copy([
    ModelBuilder<ConversationMessageBaseModel>? update,
  ]) =>
      ConversationMessage._build((dest) {
        _modelCopy(_model, dest);
        update?.call(dest);
      });

  /// Creates a new instance of [ConversationMessage],
  /// which is a copy of this with some changes
  @override
  Future<ConversationMessage> copyAsync([
    ModelBuilderAsync<ConversationMessageBaseModel>? update,
  ]) async {
    final model = ConversationMessageBaseModel();
    _modelCopy(_model, model);
    await update?.call(model);

    return ConversationMessage._build((dest) {
      _modelCopy(model, dest);
      update?.call(dest);
    });
  }

  /// Creates a new instance of [ConversationMessage],
  /// which is a copy of this with some changes
  @override
  ConversationMessage copyWith({
    MessageSender? sender,
    String? text,
  }) =>
      copy(
        (b) => b
          ..sender = sender ?? _model.sender
          ..text = text ?? _model.text,
      );

  @override
  Json toJson() => serializeToJson({
        'sender': _model.sender,
        'text': _model.text,
      }) as Json;
}

class ConversationMessageBaseModel {
  late MessageSender sender;
  late String text;
}

/// {@category sugar-class}
class ConversationResponse
    implements
        ICopyable<ConversationResponse, ConversationResponseBaseModel>,
        IEquitable,
        ISerializable {
  factory ConversationResponse({
    required ConversationMessage message,
    String? messageAudio,
  }) =>
      ConversationResponse._build(
        (b) => b
          ..message = message
          ..messageAudio = messageAudio,
      );

  ConversationResponse._build(
    ModelBuilder<ConversationResponseBaseModel> builder,
  ) {
    builder.call(_model);
  }

  static void _modelCopy(
    ConversationResponseBaseModel source,
    ConversationResponseBaseModel dest,
  ) =>
      dest
        ..message = source.message
        ..messageAudio = source.messageAudio;

  /// Prevents `unused_element` warning for the sealed class definition
  static void _dummy(_ConversationResponseModel _) {}

  factory ConversationResponse._fromModel(
    ConversationResponseBaseModel source,
  ) =>
      ConversationResponse._build((dest) => _modelCopy(source, dest));

  factory ConversationResponse.fromJson(Json json) =>
      ConversationResponse._fromModel(_modelFromJson(json));

  static ConversationResponseBaseModel _modelFromJson(
    Map<dynamic, dynamic> json,
  ) {
    final model = ConversationResponseBaseModel();

    setModelField<ConversationMessage>(
      json,
      'message',
      (v) => model.message = v!,
      getter: (j) => valueFromJson(j, ConversationMessage.fromJson),
      required: true,
    );

    setModelField<String?>(
      json,
      'messageAudio',
      (v) => model.messageAudio = v,
    );

    return model;
  }

  final ConversationResponseBaseModel _model = ConversationResponseBaseModel();

  ConversationMessage get message => _model.message;
  set message(ConversationMessage value) => _model.message = value;
  String? get messageAudio => _model.messageAudio;
  set messageAudio(String? value) => _model.messageAudio = value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationResponse &&
          eqDeep(
            _model.message,
            other._model.message,
          ) &&
          eqDeep(
            _model.messageAudio,
            other._model.messageAudio,
          );

  /// This hash code compatible with [operator ==].
  /// [ConversationResponse] classes with the same data
  /// have the same hash code.
  @override
  int get hashCode => hashList([
        message,
        if (messageAudio != null) messageAudio,
      ]);

  /// Converts this [ConversationResponse] into a [String].
  @override
  String toString() => 'ConversationResponse(\n'
      '  message: $message\n'
      '''${messageAudio != null ? '  messageAudio: ${messageAudio!}\n' : ''}'''
      ')';

  factory ConversationResponse.from(
    ConversationResponse source,
  ) =>
      ConversationResponse._build(
        (destModel) => _modelCopy(source._model, destModel),
      );

  /// Creates a new instance of [ConversationResponse],
  /// which is a copy of this with some changes
  @override
  ConversationResponse copy([
    ModelBuilder<ConversationResponseBaseModel>? update,
  ]) =>
      ConversationResponse._build((dest) {
        _modelCopy(_model, dest);
        update?.call(dest);
      });

  /// Creates a new instance of [ConversationResponse],
  /// which is a copy of this with some changes
  @override
  Future<ConversationResponse> copyAsync([
    ModelBuilderAsync<ConversationResponseBaseModel>? update,
  ]) async {
    final model = ConversationResponseBaseModel();
    _modelCopy(_model, model);
    await update?.call(model);

    return ConversationResponse._build((dest) {
      _modelCopy(model, dest);
      update?.call(dest);
    });
  }

  /// Creates a new instance of [ConversationResponse],
  /// which is a copy of this with some changes
  @override
  ConversationResponse copyWith({
    ConversationMessage? message,
    String? messageAudio,
  }) =>
      copy(
        (b) => b
          ..message = message ?? _model.message
          ..messageAudio = messageAudio ?? _model.messageAudio,
      );

  @override
  Json toJson() => serializeToJson({
        'message': _model.message,
        'messageAudio': _model.messageAudio,
      }) as Json;
}

class ConversationResponseBaseModel {
  late ConversationMessage message;
  String? messageAudio;
}

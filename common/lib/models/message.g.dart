// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

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
    required DateTime timestamp,
  }) =>
      ConversationMessage._build(
        (b) => b
          ..sender = sender
          ..text = text
          ..timestamp = timestamp,
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
        ..text = source.text
        ..timestamp = source.timestamp;

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

    setModelField<DateTime>(
      json,
      'timestamp',
      (v) => model.timestamp = v!,
      getter: (j) => dateTimeValueFromJson(j),
      required: true,
    );

    return model;
  }

  final ConversationMessageBaseModel _model = ConversationMessageBaseModel();

  MessageSender get sender => _model.sender;
  set sender(MessageSender value) => _model.sender = value;
  String get text => _model.text;
  set text(String value) => _model.text = value;
  DateTime get timestamp => _model.timestamp;
  set timestamp(DateTime value) => _model.timestamp = value;

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
          ) &&
          eqDeep(
            _model.timestamp,
            other._model.timestamp,
          );

  /// This hash code compatible with [operator ==].
  /// [ConversationMessage] classes with the same data
  /// have the same hash code.
  @override
  int get hashCode => hashList([
        sender,
        text,
        timestamp,
      ]);

  /// Converts this [ConversationMessage] into a [String].
  @override
  String toString() => 'ConversationMessage(\n'
      '  sender: $sender\n'
      '  text: $text\n'
      '  timestamp: $timestamp\n'
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
    DateTime? timestamp,
  }) =>
      copy(
        (b) => b
          ..sender = sender ?? _model.sender
          ..text = text ?? _model.text
          ..timestamp = timestamp ?? _model.timestamp,
      );

  @override
  Json toJson() => serializeToJson({
        'sender': _model.sender,
        'text': _model.text,
        'timestamp': _model.timestamp,
      }) as Json;
}

class ConversationMessageBaseModel {
  late MessageSender sender;
  late String text;
  late DateTime timestamp;
}

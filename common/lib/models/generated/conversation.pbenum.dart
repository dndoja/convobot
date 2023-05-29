///
//  Generated code. Do not modify.
//  source: conversation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class MessageAuthor extends $pb.ProtobufEnum {
  static const MessageAuthor user = MessageAuthor._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'user');
  static const MessageAuthor ai = MessageAuthor._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ai');
  static const MessageAuthor narrator = MessageAuthor._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'narrator');

  static const $core.List<MessageAuthor> values = <MessageAuthor> [
    user,
    ai,
    narrator,
  ];

  static final $core.Map<$core.int, MessageAuthor> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageAuthor? valueOf($core.int value) => _byValue[value];

  const MessageAuthor._($core.int v, $core.String n) : super(v, n);
}


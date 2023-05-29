///
//  Generated code. Do not modify.
//  source: conversation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use messageAuthorDescriptor instead')
const MessageAuthor$json = const {
  '1': 'MessageAuthor',
  '2': const [
    const {'1': 'user', '2': 0},
    const {'1': 'ai', '2': 1},
    const {'1': 'narrator', '2': 2},
  ],
};

/// Descriptor for `MessageAuthor`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageAuthorDescriptor = $convert.base64Decode('Cg1NZXNzYWdlQXV0aG9yEggKBHVzZXIQABIGCgJhaRABEgwKCG5hcnJhdG9yEAI=');
@$core.Deprecated('Use conversationMessageDescriptor instead')
const ConversationMessage$json = const {
  '1': 'ConversationMessage',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 9, '10': 'timestamp'},
    const {'1': 'author', '3': 2, '4': 1, '5': 14, '6': '.MessageAuthor', '10': 'author'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'audio', '3': 4, '4': 1, '5': 12, '9': 1, '10': 'audio', '17': true},
    const {'1': 'isPartial', '3': 5, '4': 1, '5': 8, '9': 2, '10': 'isPartial', '17': true},
  ],
  '8': const [
    const {'1': '_text'},
    const {'1': '_audio'},
    const {'1': '_isPartial'},
  ],
};

/// Descriptor for `ConversationMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationMessageDescriptor = $convert.base64Decode('ChNDb252ZXJzYXRpb25NZXNzYWdlEhwKCXRpbWVzdGFtcBgBIAEoCVIJdGltZXN0YW1wEiYKBmF1dGhvchgCIAEoDjIOLk1lc3NhZ2VBdXRob3JSBmF1dGhvchIXCgR0ZXh0GAMgASgJSABSBHRleHSIAQESGQoFYXVkaW8YBCABKAxIAVIFYXVkaW+IAQESIQoJaXNQYXJ0aWFsGAUgASgISAJSCWlzUGFydGlhbIgBAUIHCgVfdGV4dEIICgZfYXVkaW9CDAoKX2lzUGFydGlhbA==');

///
//  Generated code. Do not modify.
//  source: conversation.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'conversation.pb.dart' as $0;
export 'conversation.pb.dart';

class ConversationClient extends $grpc.Client {
  static final _$converse =
      $grpc.ClientMethod<$0.ConversationMessage, $0.ConversationMessage>(
          '/Conversation/Converse',
          ($0.ConversationMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ConversationMessage.fromBuffer(value));

  ConversationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ConversationMessage> converse(
      $async.Stream<$0.ConversationMessage> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$converse, request, options: options);
  }
}

abstract class ConversationServiceBase extends $grpc.Service {
  $core.String get $name => 'Conversation';

  ConversationServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ConversationMessage, $0.ConversationMessage>(
            'Converse',
            converse,
            true,
            true,
            ($core.List<$core.int> value) =>
                $0.ConversationMessage.fromBuffer(value),
            ($0.ConversationMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ConversationMessage> converse(
      $grpc.ServiceCall call, $async.Stream<$0.ConversationMessage> request);
}

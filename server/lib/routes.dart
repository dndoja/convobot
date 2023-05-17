import 'package:supabase_functions/supabase_functions.dart';

import 'functions/functions.dart' as fn;

typedef RequestHandler = FutureOr<Response> Function(Request request);

class RouteSettings {
  const RouteSettings(this.handler, {this.supportedMethods = const ['GET']});
  final RequestHandler handler;
  final List<String> supportedMethods;
}

enum Route {
  getConversationResponse,
  ;

  RouteSettings get settings {
    switch (this) {
      case getConversationResponse:
        return RouteSettings(fn.getConversationResponse);
    }
  }
}

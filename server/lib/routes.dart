import 'package:supabase_functions/supabase_functions.dart';

import 'functions/functions.dart' as fn;

typedef RequestHandler = FutureOr<Response> Function(Request request);

class RouteSettings {
  const RouteSettings(this.handler, {this.method = 'POST'});
  final RequestHandler handler;
  final String method;
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

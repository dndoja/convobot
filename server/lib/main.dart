import 'dart:convert';

import 'package:common/common.dart';
import 'package:dartx/dartx.dart';
import 'package:supabase_functions/supabase_functions.dart';

import 'services/services.dart';
import 'routes.dart';

void main() {
  initializeServices();

  SupabaseFunctions(fetch: (request) {
    final Route? route = enumFromString(
      request.url.pathSegments.lastOrNull,
      Route.values,
    );
    if (route == null) return Response('Not found', status: 404);

    if (!route.settings.supportedMethods.contains(request.method)) {
      return Response('Bad Request', status: 400);
    }

    return route.settings.handler(request);
  });
}

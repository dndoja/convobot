import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Response generateSpeech(Request request) {
  final String? text = request.url.queryParameters['text'];
  if (text == null) return Response.badRequest();

  return Response.ok('Hello, World!');
}

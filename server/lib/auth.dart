import 'dart:io';

import "package:googleapis_auth/auth_io.dart";

AuthClient? _client;

Future<AuthClient> getAuthClient(List<String> scopes) async {
  if (_client != null) return _client!;

  final String serviceAccountCreds =
      File('.keys/service_account.json').readAsStringSync();
  final ServiceAccountCredentials accountCredentials =
      ServiceAccountCredentials.fromJson(serviceAccountCreds);

  _client = await clientViaServiceAccount(accountCredentials, scopes);

  return _client!;
}

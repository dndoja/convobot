import 'dart:io';

import 'package:common/common.dart';

Secrets? _secrets;

Secrets get secrets {
  if (_secrets != null) return _secrets!;

  final Iterable<List<String>> envRows =
      File('.env').readAsStringSync().split('\n').map((e) => e.split('='));
  final Map<String, String> envEntries = {
    for (final row in envRows)
      row[0].removeSurrounding(prefix: '"', suffix: '"'):
          row[1].removeSurrounding(prefix: '"', suffix: '"'),
  };
  final String serviceAccountJson =
      File('.keys/service_account.json').readAsStringSync();

  _secrets = Secrets(
    openAiKey: envEntries['OPENAI_KEY']!,
    googleServiceAccount: serviceAccountJson,
  );

  return _secrets!;
}

class Secrets {
  const Secrets({
    required this.openAiKey,
    required this.googleServiceAccount,
  });
  final String openAiKey;
  final String googleServiceAccount;

  static Secrets get() => secrets;
}

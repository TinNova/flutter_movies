import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:movies/models/secret.dart';

class SecretRepo {
  final String secretPath;

  SecretRepo({this.secretPath});

  Future<Secret> getApi() {
    return rootBundle.loadStructuredData<Secret>(this.secretPath, (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}

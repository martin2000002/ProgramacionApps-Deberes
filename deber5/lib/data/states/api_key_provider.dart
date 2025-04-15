import 'package:flutter/material.dart';

class ApiKeyProvider extends ChangeNotifier {
  String? _apiKey;

  String? get apiKey => _apiKey;

  void setApiKey(String key) {
    _apiKey = key;
    notifyListeners();
  }
}

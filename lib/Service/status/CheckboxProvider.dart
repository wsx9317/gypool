import 'package:flutter/material.dart';

class CheckboxProvider extends ChangeNotifier {
  final Map<String, bool> _checked = {
    'option1': false,
    'option2': false,
    'option3': false,
  };

  Map<String, bool> get checked => _checked;

  void toggle(String key, bool value) {
    _checked[key] = value;
    notifyListeners();
  }

  void resetAll() {
    for (var key in _checked.keys) {
      _checked[key] = false;
    }
    notifyListeners();
  }
}

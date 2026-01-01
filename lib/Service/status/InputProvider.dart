import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier {
  String _name = '';
  String _number = '';
  String _subject = '';

  String get name => _name;
  String get number => _number;
  String get subject => _subject;

  void setName(String value) {
    _name = value;
    notifyListeners(); // UI 갱신
  }

  void setNumber(String value) {
    _number = value;
    notifyListeners(); // UI 갱신
  }

  void setsubject(String value) {
    _subject = value;
    notifyListeners(); // UI 갱신
  }
}

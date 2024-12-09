import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String key = 'darkModeIsEnabled';

class DarkMode with ChangeNotifier {
  bool _isEnabled = false;
  bool get isEnabled => _isEnabled;
  set toggleTo(bool value) => _isEnabled != value ? toggle() : null;

  DarkMode() {
    load();
  }

  Future<void> toggle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isEnabled = !_isEnabled;
    await prefs.setBool(key, _isEnabled);
    notifyListeners();
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isEnabled = prefs.getBool(key) ?? false;
    notifyListeners();
  }
}
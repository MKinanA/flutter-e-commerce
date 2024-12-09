import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String isLoggedInKey = 'authIsLoggedIn';
const String emailKey = 'authEmail';

class Auth with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _email;

  bool get isLoggedIn => _isLoggedIn;
  String? get email => _email;
  
  Auth() {
    load();
  }

  Future<void> setIsLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = value;
    await prefs.setBool(isLoggedInKey, _isLoggedIn);
    notifyListeners();
  }

  Future<void> setEmail(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = value;
    _email != null ? await prefs.setString(emailKey, _email!) : prefs.remove(emailKey);
    notifyListeners();
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(isLoggedInKey) ?? false;
    _email = prefs.getString(emailKey);
    notifyListeners();
  }
}
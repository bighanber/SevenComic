import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {

  static SpUtils _instance = new SpUtils._();
  factory SpUtils() => _instance;
  static SharedPreferences _prefs;

  SpUtils._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJson(String key, dynamic jsonVal) {
    String jsonStr = jsonEncode(jsonVal);
    return _prefs.setString(key, jsonStr);
  }

  dynamic getJson(String key) {
    String jsonStr = _prefs.getString(key);
    return jsonStr == null ? null : jsonDecode(jsonStr);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs.setBool(key, val);
  }

  bool getBool(String key) {
    bool val = _prefs.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static SharedPreferences? _prefsInstance;
  static const String TOKEN = "token";
  static const String IMAGE_GEN_KEY = "CAR_KEY";

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setString(key, value);
  }

  static int? getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue;
  }

  static Future<bool> setInt(String key, int value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static List<String> getList(String key, [List<String>? defValue]) {
    return _prefsInstance?.getStringList(key) ?? defValue ?? [];
  }

  static Future<bool> setList(String key, List<String> value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setStringList(key, value);
  }
}

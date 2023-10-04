import 'dart:io';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }
  static const String appName = 'باركينج Parking';
  static const String packageName = 'com.linkconnects.parking';
  static const String languageDefault = "en";
  static final Map<String, String> languagesSupported = {
    'en': "English",
    'ar': "العربية",
  };


  init() async {}
}
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  static const String appName = 'Art Botic';
  static const String packageName =
      'com.artbotic.aiart.artgenerator.artavatar.aiphoto';
  static const String languageDefault = "en";
  static final Map<String, String> languagesSupported = {
    'en': "English",
    'ar': "Arabic",
    'es': "Spanish",
    'pt': "Portuguese",
    'de': "German",
    'fr': "French",
    'ur': "Urdu",
    'hi': "Hindi"
  };

  init() async {}
}

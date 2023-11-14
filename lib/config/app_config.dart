import 'package:artbotic/config/preferences.dart';
import 'package:artbotic/config/theme.dart';
import 'package:artbotic/services/pref_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../services/notifications_services.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  AppConfig._internal();
  factory AppConfig() => _instance;

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

  init() async {
    await Pref.init();
    await _initializeNotifications();
    _initializeEasyLoading();
  }

  _initializeNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    PrefProvider().getFCMToken() ?? await PrefProvider().setFCMToken();

    await NotificationServices.instance.initializePlatformNotifications();
    NotificationServices.instance.showForegroundNotifications();
  }

  _initializeEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..userInteractions = false
      ..dismissOnTap = false
      ..maskType = EasyLoadingMaskType.black
      ..backgroundColor = AppTheme.darkPrimaryColor
      ..indicatorColor = AppTheme.purpleColor
      ..textColor = AppTheme.whiteColor;
  }
}

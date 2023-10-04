import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_config.dart';
import '../local_data_layer/local_data_layer.dart';

class LanguageController extends GetxController {
  Rx<Locale> locale = Rx(const Locale(AppConfig.languageDefault));

  void selectLanguage(String countryCode) {
    locale.value = Locale(countryCode);
    update();
  }

  void getCurrentLanguage() async {
    String? currLang = await (LocalDataLayer().getCurrentLanguage());
    selectLanguage(currLang!);
  }

  void setCurrentLanguage(String langCode) async {
    await LocalDataLayer().setCurrentLanguage(langCode);
    selectLanguage(langCode);
  }
}

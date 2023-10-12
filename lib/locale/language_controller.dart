import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_config.dart';
import '../local_data_layer/local_data_layer.dart';
import '../utils/app_const.dart';

class LanguageController extends GetxController {
  final List<String> flags = [
    AppConsts.english,
    AppConsts.arabic,
    AppConsts.spanish,
    AppConsts.portuguese,
    AppConsts.german,
    AppConsts.french,
    AppConsts.urdu,
    AppConsts.hindi,
  ];

  Rx<Locale> locale = Rx(const Locale(AppConfig.languageDefault));

  late String selectedLangCode;

  void selectLocale(String countryCode) {
    selectedLangCode = countryCode;
    update();
  }

  void selectLanguage(String countryCode) {
    locale.value = Locale(countryCode);
    update();
  }

  void getCurrentLanguage() async {
    String? currLang = await (LocalDataLayer().getCurrentLanguage());
    selectedLangCode = currLang ?? AppConfig.languageDefault;
    selectLanguage(currLang!);
  }

  void setCurrentLanguage(String langCode) async {
    await LocalDataLayer().setCurrentLanguage(langCode);
    selectLanguage(langCode);
  }
}

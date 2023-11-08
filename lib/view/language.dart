import 'package:artbotic/config/app_config.dart';
import 'package:artbotic/config/theme.dart';
import 'package:artbotic/locale/language_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';

class Language extends StatelessWidget {
  Language({super.key});

  final LanguageController controller = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    controller.selectedLangCode = Get.locale!.languageCode;
    final s = S.of(context);

    return Scaffold(
        appBar: AppBar(
            leadingWidth: Get.width / 2,
            leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(s.language,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 22)))),
            actions: [
              Container(
                  width: Get.width * 0.3,
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButton(
                      title: s.apply,
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      onTap: () {
                        controller
                            .setCurrentLanguage(controller.selectedLangCode);
                        navigatorKey.currentState!.pop();
                      },
                      borderRadius: 4))
            ]),
        body: ListView.builder(
            itemCount: AppConfig.languagesSupported.length,
            itemBuilder: (context, index) {
              final languageCode =
                  AppConfig.languagesSupported.keys.elementAt(index);
              final String languageName =
                  AppConfig.languagesSupported.values.elementAt(index);
              final String languageFlag = controller.flags[index];

              return GetBuilder<LanguageController>(builder: (logic) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 15, 24, 15),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: controller.selectedLangCode == languageCode
                                ? AppTheme.purpleColor
                                : Theme.of(context).primaryColor),
                        child: ListTile(
                            onTap: () => controller.selectLocale(languageCode),
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            selectedColor: Theme.of(context).primaryColor,
                            title: Text(languageName),
                            trailing: Image(
                                image: AssetImage(languageFlag),
                                height: 25,
                                width: 25))));
              });
            }));
  }
}

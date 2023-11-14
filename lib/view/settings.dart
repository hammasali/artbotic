import 'package:artbotic/controllers/theme_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:artbotic/view/components/dialogs/customer_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme.dart';
import '../controllers/setting_controller.dart';
import '../generated/l10n.dart';
import '../utils/app_const.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final SettingController controller = Get.put(SettingController());
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
        body: ListView(padding: const EdgeInsets.all(16), children: [
      customHeader(s.pro, context),
      const SizedBox(height: 12),
      CustomButton(
          icon: AppConsts.king,
          borderRadius: 12,
          title: s.upgradeToPro,
          onTap: () =>
              navigatorKey.currentState!.pushNamed(PageRoutes.subscriptions)),
      const SizedBox(height: 15),
      customHeader(s.general, context),
      const SizedBox(height: 12),
      ListTile(
          leading: Image(
              image: const AssetImage(AppConsts.theme),
              height: 28,
              width: 28,
              color: Theme.of(context).iconTheme.color),
          title: Text(s.theme, style: Theme.of(context).textTheme.bodyLarge),
          trailing: Obx(() {
            return CupertinoSwitch(
                applyTheme: true,
                activeColor: AppTheme.purpleColor,
                value: themeController.themeMode.value == ThemeMode.dark,
                onChanged: (bool value) {
                  themeController.updateAppTheme();
                });
          })),
      customTile(AppConsts.rateUs, s.rateUs, context, () {}),
      customTile(AppConsts.share, s.share, context, () {}),
      customTile(AppConsts.customerSupport, s.customerSupport, context,
          () => showCustomerSupportPrompt()),
      const SizedBox(height: 15),
      customHeader(s.others, context),
      const SizedBox(height: 12),
      customTile(AppConsts.language, s.language, context,
          () => navigatorKey.currentState!.pushNamed(PageRoutes.language)),
      customTile(AppConsts.moreApps, s.moreApps, context, () {}),
          customTile(AppConsts.privacyPolicy, s.privacyPolicy, context,
          controller.privacyPolicy)
    ]));
  }

  customHeader(String s, BuildContext context) {
    return Row(children: [
      Text(s, style: Theme.of(context).textTheme.bodySmall),
      SizedBox(width: Get.width * 0.1),
      const Expanded(child: Divider())
    ]);
  }

  customTile(String icon, String title, BuildContext context, onTap) {
    return ListTile(
        onTap: onTap,
        leading: Image(
            image: AssetImage(icon),
            height: 28,
            width: 28,
            color: Theme.of(context).iconTheme.color),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        trailing: Image(
            image: const AssetImage(AppConsts.arrowRight),
            height: 16,
            width: 16,
            color: Theme.of(context).iconTheme.color));
  }
}

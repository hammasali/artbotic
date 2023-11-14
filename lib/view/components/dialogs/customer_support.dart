import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:artbotic/view/components/fields/custom_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme.dart';
import '../../../controllers/setting_controller.dart';
import '../../../generated/l10n.dart';
import '../fields/custom_field2.dart';

showCustomerSupportPrompt() {
  final SettingController controller = Get.find<SettingController>();

  return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        final s = S.of(context);
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
                alignment: Alignment.center,
                child: Container(
                    width: Get.width * 0.9,
                    height: Get.height * 0.62,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(right: 4),
                          child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('dialog'),
                              child: const Icon(Icons.close))),
                      Text(s.sendUsAMessage,
                          style: Theme.of(context).textTheme.titleLarge),
                      const Spacer(),
                      CustomTextField(
                          controller: controller.nameController,
                          hintText: s.fullName),
                      const SizedBox(height: 5),
                      CustomTextField(
                          controller: controller.emailController,
                          hintText: s.yourEmail),
                      const Spacer(),
                      CustomTextField2(
                          controller: controller.messageController,
                          hintText: s.writeYourQueriesHere,
                          borderColor: AppTheme.darkAccentColor),
                      const Spacer(),
                      CustomButton(
                          title: s.submitForm, onTap: controller.feedBack)
                    ]))));
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child);
      });
}

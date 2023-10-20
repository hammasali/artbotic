import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/create_controller.dart';
import '../../../generated/l10n.dart';

showDetailPrompt(String image, String prompt) {
  final s = S.of(Get.context!);
  final CreateController controller = Get.find<CreateController>();


  return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: Get.context!,
      pageBuilder: (context, anim1, anim2) {
        return ScaffoldMessenger(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
                alignment: Alignment.center,
                child: Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.7,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              alignment: Alignment.topRight,
                              padding: const EdgeInsets.only(right: 16),
                              child: GestureDetector(
                                  onTap: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog'),
                                  child: const Icon(Icons.close))),

                          /// IMAGE
                          Container(
                              width: Get.width * 0.6,
                              height: Get.height * 0.37,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).primaryColor,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5))
                                  ])),

                          /// PROMPT
                          Container(
                              width: Get.width * 0.7,
                              height: Get.height * 0.17,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Theme.of(context).hintColor),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).primaryColor,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5))
                                  ]),
                              child: Stack(children: [
                                RichText(
                                    text: TextSpan(
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: '${s.prompt}\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(fontSize: 20)),
                                      TextSpan(
                                          text: prompt,
                                          style: Theme.of(Get.context!)
                                              .textTheme
                                              .bodySmall)
                                    ])),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: () {
                                          Clipboard.setData(
                                              ClipboardData(text: prompt));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                               SnackBar(content: Text(s.textCopiedToClipboard))
                                          );

                                        },
                                        child: const Icon(Icons.copy, size: 20)))
                              ])),

                          ///CUSTOM BUTTON
                          SizedBox(
                              width: Get.width / 2,
                              child: CustomButton(
                                  title: s.tryThisPrompt,
                                  borderRadius: 8,
                                  verticalPadding: 4,
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  onTap: () {
                                    controller.promptController.text = prompt;
                                    controller.isClearText.value = true;
                                    Navigator.of(context, rootNavigator: true)
                                        .pop('dialog');
                                  }))
                        ]))),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child);
      });
}

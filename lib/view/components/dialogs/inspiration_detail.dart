import 'package:artbotic/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';

showDetailPrompt() {
  final s = S.of(Get.context!);

  return showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: Get.context!,
    pageBuilder: (context, anim1, anim2) {
      return Align(
          alignment: Alignment.center,
          child: Container(
              width: Get.width * 0.8,
              height: Get.height * 0.62,
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
                    Container(
                        width: Get.width * 0.6,
                        height: Get.height * 0.37,
                        decoration: BoxDecoration(
                            color: AppTheme.purpleColor,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).primaryColor,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ])),
                    Container(
                        width: Get.width * 0.7,
                        height: Get.height * 0.17,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                            border:
                                Border.all(color: Theme.of(context).hintColor),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).primaryColor,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ]),
                        child: Stack(
                          children: [
                            const Positioned(
                                top: 2,
                                right: 2,
                                child: Icon(Icons.copy, size: 20)),
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
                                      text:
                                          'This is a description text. It can have different styles within the same text block. ',
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .bodySmall)
                                ])),
                          ],
                        ))
                  ])));
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}

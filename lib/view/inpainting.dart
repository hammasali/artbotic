import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme.dart';
import '../generated/l10n.dart';
import '../utils/app_const.dart';

class InPainting extends StatelessWidget {
  const InPainting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: Column(children: [
          /// GET IMAGE
          getImage(),

          /// MASKING OPTIONS
          getOptions(context)
        ]));
  }

  getAppBar(BuildContext context) {
    final s = S.of(context);

    return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => navigatorKey.currentState!.pop(),
        ),
        title: Text(s.create, style: Theme.of(context).textTheme.titleMedium),
        actions: [
          Container(
              width: Get.width * 0.3,
              padding: const EdgeInsets.all(10.0),
              child: CustomButton(
                  title: s.apply,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  onTap: () {
                    navigatorKey.currentState!.pop();
                  },
                  borderRadius: 4))
        ]);
  }

  getImage() {
    return Container(
        margin: const EdgeInsets.all(24),
        height: screenHeight * 0.6,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(12)));
  }

  getOptions(BuildContext context) {
    final s = S.of(context);

    return Container(
        width: Get.width * 0.7,
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppConsts.mask,
                    color: Theme.of(context).iconTheme.color, height: 30),
                Text(s.mask, style: Theme.of(context).textTheme.titleMedium)
              ]),
          Container(
              decoration: BoxDecoration(
                  color: AppTheme.pinkColor,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Image.asset(AppConsts.maskBrush,
                  color: Theme.of(context).iconTheme.color, height: 40)),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.pinkColor),
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(AppConsts.maskErase,
                  color: Theme.of(context).iconTheme.color, height: 40))
        ]));
  }
}

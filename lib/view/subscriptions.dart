import 'package:artbotic/config/theme.dart';
import 'package:artbotic/controllers/purchasing_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';
import '../utils/globals.dart';

class Subscription extends StatelessWidget {
  Subscription({super.key});

  final PurchasingController controller = Get.put(PurchasingController());

  final Map<String, String> items = {
    AppConsts.fastProcessing: 'Fast Processing',
    AppConsts.diamond: 'Unlimited Gems',
    AppConsts.upscaling: '4x Upscaling',
    AppConsts.adFree: 'Ad Free',
  };

  final Map<String, String> subs = {
    '500': 'Weekly',
    '2500': 'Monthly',
    '25500': 'Yearly'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: screenHeight,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        getHeader(context, screenHeight),
        getBackground(
            screenHeight,
            SizedBox(
                height: screenHeight * 0.45,
                child: Column(children: [
                  getPremiumItems(context, screenHeight),

                  /// SUBSCRIPTIONS
                  SizedBox(
                      height: screenHeight * 0.15,
                      width: double.infinity,
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: subs.entries
                              .map((e) => Obx(() {
                                    var isSelected =
                                        controller.selectedSubscription.value ==
                                            e.value;
                                    return InkWell(
                                        onTap: () => controller
                                            .selectedSubscription
                                            .value = e.value,
                                        child: Container(
                                            height: screenHeight * 0.13,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: isSelected
                                                        ? AppTheme.pinkColor
                                                        : AppTheme.greyColor),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Column(children: [
                                              Expanded(
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(e.key,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  fontSize:
                                                                      16)))),
                                              Container(
                                                  width: double.infinity,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      // gradient: isSelected
                                                      //     ? const LinearGradient(
                                                      //         colors: [
                                                      //             AppTheme
                                                      //                 .blueColor,
                                                      //             AppTheme
                                                      //                 .purpleColor
                                                      //           ],
                                                      //         begin: Alignment
                                                      //             .topCenter,
                                                      //         end: Alignment
                                                      //             .bottomCenter)
                                                      //     : null,
                                                      color: isSelected
                                                          ? AppTheme.pinkColor
                                                          : AppTheme.greyColor,
                                                      borderRadius:
                                                          const BorderRadius.vertical(
                                                              bottom:
                                                                  Radius.circular(
                                                                      15))),
                                                  child: Text(e.value,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: isSelected
                                                                  ? AppTheme
                                                                      .whiteColor
                                                                  : AppTheme
                                                                      .blackColor)))
                                            ])));
                                  }))
                              .toList())),

                  /// BUTTON
                  Container(
                      height: screenHeight * 0.1,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: CustomButton(
                          title: 'Continue',
                          onTap: () {},
                          verticalPadding: 4,
                          borderRadius: 8,
                          textStyle: Theme.of(context).textTheme.displayLarge))
                ])))
      ]),
    ));
  }

  getHeader(BuildContext context, double screenHeight) {
    return Stack(alignment: Alignment.center, children: [
      ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(40)),
          child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                    stops: const [0.1, 0.9],
                  ).createShader(bounds),
              blendMode: BlendMode.darken,
              child: Image(
                  image: const AssetImage(AppConsts.ai),
                  height: screenHeight * 0.55,
                  width: Get.width,
                  fit: BoxFit.cover))),
      Positioned(
          bottom: 15,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppTheme.whiteColor),
                  children: <TextSpan>[
                    const TextSpan(text: 'ArtBotic Pro\n'),
                    TextSpan(
                        text: 'Unshackle your imaginative spirit',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppTheme.whiteColor))
                  ]))),
      Positioned(
          left: 20,
          top: 35,
          child: GestureDetector(
              onTap: () => navigatorKey.currentState!.pop(),
              child: const Image(
                  image: AssetImage(AppConsts.close),
                  fit: BoxFit.cover,
                  height: 25,
                  width: 25))),
    ]);
  }

  getBackground(double screenHeight, Widget children) {
    return Stack(children: [
      Image(
          image: const AssetImage(AppConsts.circuit),
          fit: BoxFit.cover,
          width: Get.width,
          height: screenHeight * 0.45),
      children
    ]);
  }

  getPremiumItems(BuildContext context, double screenHeight) {
    return Column(children: [
      SizedBox(height: screenHeight * 0.05),
      SizedBox(
          height: screenHeight * 0.15,
          child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 30,
                  childAspectRatio: 4,
                  crossAxisCount: 2),
              children: items.entries
                  .map((e) => Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Theme.of(context).hintColor)),
                      child: Row(children: [
                        const SizedBox(width: 10),
                        Image(
                            image: AssetImage(e.key),
                            fit: BoxFit.cover,
                            height: 18,
                            width: 18),
                        const SizedBox(width: 10),
                        Text(e.value,
                            style: Theme.of(context).textTheme.bodyMedium)
                      ])))
                  .toList()))
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_slider/gradient_slider.dart';

import '../../../config/theme.dart';
import '../../../controllers/create_controller.dart';
import '../../../generated/l10n.dart';
import '../../../utils/app_const.dart';
import '../fields/custom_fields.dart';

advanceSettingsModelSheet() {
  final s = S.of(Get.context!);

  return showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (BuildContext context) => SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(s.advanceSettings,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20))),
                    getNegativePrompt(),
                    aspectRatioChoice(),
                    customSlider1(),
                    customSlider2()
                  ]))));
}

getNegativePrompt() {
  final s = S.of(Get.context!);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 15),
        Text(s.negativePrompt,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        CustomTextField(hintText: s.dontInclude),
        const SizedBox(height: 30)
      ]));
}

aspectRatioChoice() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);

  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(s.aspectRatio,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700))),
    const SizedBox(height: 12),
    SizedBox(
        height: 35,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 24),
            itemCount: controller.options.length,
            itemBuilder: (context, index) {
              String icon = controller.options.keys.elementAt(index);
              String ratio = controller.options.values.elementAt(index);
              return Obx(() {
                bool isSelected = controller.selectedIndex.value == index;

                return InkWell(
                    onTap: () {
                      controller.selectedIndex.value = index;
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : Theme.of(context).iconTheme.color!),
                            color: isSelected
                                ? null
                                : Theme.of(context).primaryColor,
                            gradient: isSelected
                                ? const LinearGradient(
                                    colors: [
                                        AppTheme.blueColor,
                                        AppTheme.purpleColor
                                      ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight)
                                : null),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage(icon),
                                  height: 16,
                                  width: 16,
                                  color: isSelected
                                      ? AppTheme.whiteColor
                                      : AppTheme.blackColor),
                              const SizedBox(width: 8),
                              Text(ratio,
                                  style: isSelected
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color))
                            ])));
              });
            },
            separatorBuilder: (context, index) => const SizedBox(width: 15))),
    const SizedBox(height: 30)
  ]);
}

customSlider1() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(s.cgfScale,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
        Obx(() {
          return GradientSlider(
              thumbAsset: AppConsts.sliderHead,
              thumbHeight: 20,
              thumbWidth: 20,
              trackBorder: 1,
              trackBorderColor: Colors.black,
              activeTrackGradient: const LinearGradient(
                  colors: [AppTheme.blueColor, AppTheme.purpleColor]),
              inactiveTrackGradient: LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade800]),
              slider: Slider(
                  min: 0.0,
                  max: 10,
                  value: controller.slider1.value,
                  onChanged: (val) {
                    controller.slider1.value = val;
                  }));
        }),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(s.betterQuality,
              style: Theme.of(Get.context!).textTheme.bodySmall),
          Text(s.matchPrompt, style: Theme.of(Get.context!).textTheme.bodySmall)
        ]),
        const Divider()
      ]));
}

customSlider2() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(s.seed,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
        Obx(() {
          return GradientSlider(
              thumbAsset: AppConsts.sliderHead,
              thumbHeight: 20,
              thumbWidth: 20,
              trackBorder: 1,
              trackBorderColor: Colors.black,
              activeTrackGradient: const LinearGradient(
                  colors: [AppTheme.blueColor, AppTheme.purpleColor]),
              inactiveTrackGradient: LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade800]),
              slider: Slider(
                  min: 0.0,
                  max: 10,
                  value: controller.slider2.value,
                  onChanged: (val) {
                    controller.slider2.value = val;
                  }));
        }),
        const SizedBox(height: 15)
      ]));
}

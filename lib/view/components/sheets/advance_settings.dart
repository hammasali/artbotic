import 'package:artbotic/data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_slider/gradient_slider.dart';

import '../../../config/theme.dart';
import '../../../controllers/create_controller.dart';
import '../../../generated/l10n.dart';
import '../../../utils/app_const.dart';
import '../../../utils/globals.dart';
import '../fields/custom_fields.dart';

advanceSettingsModelSheet() {
  final s = S.of(Get.context!);

  return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (BuildContext context) => Padding(
          padding: MediaQuery.of(context).viewInsets, // <-- Add this line
          child: SingleChildScrollView(
              child: Container(
                  height: screenHeight * 0.75,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        customSlider2(),
                        getSeedScaling()
                      ])))));
}

getSeedScaling() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CustomTextField(
          controller: controller.seedController,
          keyboardType: TextInputType.number,
          hintText: s.enterCustomSeedDefault0));
}

getNegativePrompt() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: screenHeight * 0.02),
        Text(s.negativePrompt,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
        SizedBox(height: screenHeight * 0.01),
        CustomTextField(
            controller: controller.negPromptController,
            hintText: s.dontInclude),
        SizedBox(height: screenHeight * 0.03),
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
    SizedBox(height: screenHeight * 0.02),
    SizedBox(
        height: screenHeight * 0.05,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 24),
            itemCount: AppDataSet.options.length,
            itemBuilder: (context, index) {
              String icon = AppDataSet.options.keys.elementAt(index);
              String ratio = AppDataSet.options.values.elementAt(index);
              return Obx(() {
                bool isSelected =
                    controller.selectedAspectRatioIndex.value == index;

                return InkWell(
                    onTap: () {
                      controller.selectedAspectRatioIndex.value = index;
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
                                      ? Theme.of(context).textTheme.bodyLarge
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
    SizedBox(height: screenHeight * 0.03),
  ]);
}

customSlider1() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);

  return Obx(() {
    return Container(
        height: screenHeight * 0.15,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(s.selectIterations,
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
            Text('${controller.sliderIterations.value} ${s.iterations}',
                style: Theme.of(Get.context!).textTheme.bodyMedium!)
          ]),
          GradientSlider(
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
                  max: 51,
                  value: controller.sliderIterations.value.toDouble(),
                  onChanged: (val) {
                    controller.sliderIterations.value = val.toInt();
                  })),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(s.betterQuality,
                style: Theme.of(Get.context!).textTheme.bodySmall),
            Text(s.matchPrompt,
                style: Theme.of(Get.context!).textTheme.bodySmall)
          ]),
          const Divider(),
        ]));
  });
}

customSlider2() {
  final CreateController controller = Get.find<CreateController>();
  final s = S.of(Get.context!);

  return Obx(() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(s.selectGuidanceScale,
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
            Text('${controller.sliderScaling.value} ${s.scale}',
                style: Theme.of(Get.context!).textTheme.bodyMedium!)
          ]),
          GradientSlider(
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
                  max: 20,
                  value: controller.sliderScaling.value.toDouble(),
                  onChanged: (val) {
                    controller.sliderScaling.value = val.toInt();
                  }))
        ]));
  });
}

import 'package:artbotic/config/theme.dart';
import 'package:artbotic/controllers/create_controller.dart';
import 'package:artbotic/data/app_data.dart';
import 'package:artbotic/model/Styles_model.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:artbotic/view/components/buttons/custom_button3.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../utils/app_const.dart';
import 'components/dialogs/inspiration_detail.dart';
import 'components/dotted_border.dart';
import 'components/fields/custom_field2.dart';
import 'components/sheets/advance_settings.dart';
import 'components/sheets/tag_keywords.dart';

class Create extends StatelessWidget {
  Create({super.key});

  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(shrinkWrap: true, children: [
          /// TAB BUTTONS
          tabButtons(context),

          /// ADD IMAGE
          addImageContainer(context),

          /// Enter PROMPT
          enterPromptContainer(context),

          /// SELECT STYLES
          selectStyles(context),

          /// ADVANCE SETTINGS
          advanceSettings(context),

          /// GENERATE BUTTON
          generateBtn(context),

          /// INSPIRATION
          inspiration(context)
        ]),
      );
    });
  }

  tabButtons(BuildContext context) {
    final s = S.of(context);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomButton3(
              isSelected: controller.isTextSelected.value,
              text: s.text,
              icon: AppConsts.text,
              onTap: () {
                controller.isTextSelected.value = true;
                controller.isImageSelected.value = false;
                controller.isInPantingSelected.value = false;
                controller.resetImage();
                controller.diffusionApiType = DiffusionApiType.textToImage;
              }),
          const SizedBox(width: 10),
          CustomButton3(
              isSelected: controller.isImageSelected.value,
              text: s.image,
              icon: AppConsts.gallery,
              onTap: () {
                controller.isTextSelected.value = false;
                controller.isImageSelected.value = true;
                controller.isInPantingSelected.value = false;
                controller.resetImage();
                controller.diffusionApiType = DiffusionApiType.imageToImage;
              }),
          const SizedBox(width: 10),
          CustomButton3(
              isSelected: controller.isInPantingSelected.value,
              text: s.inpainting,
              icon: AppConsts.inPainting,
              onTap: () {
                controller.isTextSelected.value = false;
                controller.isImageSelected.value = false;
                controller.isInPantingSelected.value = true;
                controller.resetImage();
                controller.diffusionApiType = DiffusionApiType.inPainting;
              })
        ]);
  }

  addImageContainer(BuildContext context) {
    final s = S.of(context);
    if (controller.isTextSelected.value) {
      return const SizedBox.shrink();
    }

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.addImage,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.darkAccentColor),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(() {
                      if (controller.initImageUrl.value == null) {
                        return GestureDetector(
                            onTap: controller.pickImage,
                            child: imageHolder(context, false));
                      }

                      String imageUrl = controller.diffusionApiType ==
                              DiffusionApiType.imageToImage
                          ? controller.initImageUrl.value!
                          : controller.maskImageUrl.value!;

                      return Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              width: 100,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url,
                                      downloadProgress) =>
                                  Stack(alignment: Alignment.center, children: [
                                imageHolder(context, true),
                              ]),
                              errorWidget: (context, url, val) =>
                                  GestureDetector(
                                      onTap: controller.pickImage,
                                      child: imageHolder(context, false)),
                            )),
                        Positioned(
                            top: -10,
                            right: -10,
                            child: IconButton(
                                onPressed: controller.resetImage,
                                icon: const Icon(Icons.remove_circle,
                                    color: AppTheme.pinkColor)))
                      ]);
                    })
                  ]))
        ]));
  }

  enterPromptContainer(BuildContext context) {
    final s = S.of(context);

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.enterPrompt,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.darkAccentColor),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Image(
                                  image: AssetImage(AppConsts.edit),
                                  height: 18,
                                  width: 18)),
                          Expanded(
                              child: CustomTextField2(
                                  controller: controller.promptController,
                                  onChange: controller.shouldShowClearTextIcon,
                                  hintText: s.description)),
                        ]),
                    Row(children: [
                      InkWell(
                          onTap:
                              controller.updateTextFieldWithRandomInspiration,
                          child: const Image(
                              image: AssetImage(AppConsts.idea),
                              height: 24,
                              width: 24)),
                      const SizedBox(width: 6),
                      InkWell(
                        onTap: tagKeywordsSheet,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppTheme.purpleColor),
                                borderRadius: BorderRadius.circular(20.0)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Row(children: [
                              Text(s.promptBuilder,
                                  style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(width: 6),
                              const Image(
                                  image: AssetImage(AppConsts.colors),
                                  height: 12,
                                  width: 12)
                            ])),
                      ),
                      const Spacer(),
                      Obx(() => controller.isClearText.value
                          ? GestureDetector(
                              onTap: () {
                                controller.isClearText.value = false;
                                controller.promptController.clear();
                              },
                              child: const Icon(Icons.close))
                          : const SizedBox.shrink())
                    ])
                  ]))
        ]));
  }

  selectStyles(BuildContext context) {
    final s = S.of(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(s.selectStyles,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20)),
            // TextButton(
            //     onPressed: selectSettingsModelSheet,
            //     child: Text(s.seeAll,
            //         style: Theme.of(context).textTheme.bodyLarge))
            Obx(() {
              return Text('${controller.selectedStyleModalName.value} >',
                  style: Theme.of(context).textTheme.bodyLarge);
            })
          ])),
      const SizedBox(height: 10),
      SizedBox(
          height: screenHeight * 0.4,
          width: double.infinity,
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30),
              itemCount: AppDataSet.styleModels.length,
              itemBuilder: (BuildContext context, int index) {
                final StylesModel model =
                    StylesModel.fromJson(AppDataSet.styleModels[index]);

                return Obx(() {
                  final isSelected =
                      controller.selectedStyleIndex.value == index;

                  return GestureDetector(
                      onTap: () {
                        controller.selectedStyleIndex.value = index;
                        controller.selectedStyleModalName.value =
                            model.modelName!;
                        controller.selectedStyleModel = model;
                      },
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                            height: screenHeight * 0.14,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: isSelected
                                        ? AppTheme.purpleColor
                                        : Colors.transparent,
                                    width: 2),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(model.drawable!),
                                    fit: BoxFit.cover))),
                        SizedBox(height: screenHeight * 0.01),
                        Expanded(
                            child: Container(
                                alignment: Alignment.topCenter,
                                child: Text(model.modelName!,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)))
                      ]));
                });
              })),
      const SizedBox(height: 15)
    ]);
  }

  advanceSettings(BuildContext context) {
    final s = S.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.advanceSettings,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          ListTile(
              title: Text(s.chooseSettings,
                  style: Theme.of(context).textTheme.bodyLarge),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Theme.of(context).primaryColor,
              trailing: Image(
                  image: const AssetImage(AppConsts.arrowDown),
                  color: Theme.of(context).iconTheme.color,
                  height: 20,
                  width: 20),
              onTap: advanceSettingsModelSheet),
          const SizedBox(height: 12)
        ]));
  }

  generateBtn(BuildContext context) {
    final s = S.of(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: CustomButton(
            title: s.generate,
            borderRadius: 8,
            icon: AppConsts.brush,
            onTap: controller.generateImage));
  }

  inspiration(BuildContext context) {
    final s = S.of(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(s.inspiration,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20))),
      GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 22,
              crossAxisSpacing: 30),
          itemCount: AppDataSet.inspirations.length,
          itemBuilder: (BuildContext context, int index) {
            final String image = AppDataSet.inspirations[index]['icon']!;
            final String prompt = AppDataSet.inspirations[index]['prompt']!;

            return InkWell(
                onTap: () => showDetailPrompt(image, prompt),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover))));
          }),
      const SizedBox(height: 15)
    ]);
  }

  imageHolder(BuildContext context, bool isLoading) {
    final s = S.of(context);

    return Stack(alignment: Alignment.center, children: [
      const SizedBox(
          height: 120,
          width: 100,
          child: DashedRect(
              color: AppTheme.purpleColor, strokeWidth: 2.0, gap: 3.0)),
      isLoading
          ? const CircularProgressIndicator.adaptive(
              backgroundColor: AppTheme.whiteColor)
          : Column(children: [
              Image(
                  image: const AssetImage(AppConsts.addImage),
                  color: Theme.of(context).iconTheme.color,
                  height: 25,
                  width: 25),
              const SizedBox(height: 10),
              Text(s.uploadImage, style: Theme.of(context).textTheme.bodySmall)
            ])
    ]);
  }
}

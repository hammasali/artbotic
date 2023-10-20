import 'package:artbotic/data/app_data.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme.dart';
import '../../../controllers/create_controller.dart';
import '../../../generated/l10n.dart';

tagKeywordsSheet() {
  final s = S.of(Get.context!);
  final CreateController controller = Get.find<CreateController>();

  return showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      builder: (BuildContext context) => Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          height: screenHeight * 0.8,
          child: Column(children: [
            Center(
                child: Text(s.tagKeywords,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20))),

            /// SELECTED TAGS
            getSelectedTags(context),

            /// ITEMS TAGS
            const Divider(),
            getKeyItems(context),
            const Divider(),

            /// KEYWORDS
            getKeywords(context),

            /// BUTTONS
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(
                      child: CustomButton(
                          title: s.clearAll,
                          textColor: Theme.of(context).iconTheme.color,
                          color: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor
                          ],
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          borderRadius: 5,
                          onTap: () => controller.selectedTags.clear())),
                  const SizedBox(width: 10),
                  Flexible(
                      child: CustomButton(
                          title: s.addKeywords,
                          borderRadius: 5,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          onTap: () {
                            controller.promptController.text =
                                controller.selectedTags.join(', ');
                            controller.isClearText.value = true;
                            Navigator.of(context).pop();
                          }))
                ]))
          ])));
}

getKeywords(BuildContext context) {
  final CreateController controller = Get.find<CreateController>();

  return Obx(() {
    return Expanded(
        child: SingleChildScrollView(
            child: Wrap(
                spacing: 5.0,
                alignment: WrapAlignment.start,
                children: AppDataSet.tagKeywords.values
                    .elementAt(controller.selectedTagIndex.value)
                    .map((e) => ChoiceChip(
                        label: Text(e,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        selected: controller.selectedTags.contains(e),
                        onSelected: (newVal) {
                          if (!controller.selectedTags.contains(e)) {
                            controller.selectedTags.add(e);
                          }
                        },
                        selectedColor: AppTheme.pinkColor,
                        selectedShadowColor: AppTheme.pinkColor))
                    .toList())));
  });
}

getKeyItems(BuildContext context) {
  final CreateController controller = Get.find<CreateController>();

  return SizedBox(
      height: 100,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          itemCount: AppDataSet.images.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            final String image = AppDataSet.images[index];
            final String title = AppDataSet.tagKeywords.keys.elementAt(index);

            return Obx(() {
              final isSelected = controller.selectedTagIndex.value == index;
              return InkWell(
                  onTap: () => controller.selectedTagIndex.value = index,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isSelected
                                  ? AppTheme.purpleColor
                                  : Colors.transparent,
                              width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Container(
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.cover))),
                        Container(
                            width: 100,
                            height: 20,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                color: AppTheme.blackColor.withOpacity(0.7),
                                borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(8))),
                            child: Text(title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: AppTheme.whiteColor)))
                      ])));
            });
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15)));
}

getSelectedTags(BuildContext context) {
  final CreateController controller = Get.find<CreateController>();

  return Obx(() {
    if (controller.selectedTags.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(children: [
      const SizedBox(height: 10),
      SizedBox(
        height: 30,
        child: Obx(() {
          return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: controller.selectedTags
                  .map((e) => Container(
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.pinkColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: ChoiceChip(
                            label: Text(e,
                                style: Theme.of(context).textTheme.bodyLarge!),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            selected: true,
                            onSelected: (newVal) =>
                                controller.selectedTags.remove(e),
                            selectedShadowColor: AppTheme.pinkColor,
                            selectedColor: Colors.transparent,
                            avatar: const Icon(Icons.close, size: 15),
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity),
                      ))
                  .toList());
        }),
      ),
      const SizedBox(height: 5),
    ]);
  });
}

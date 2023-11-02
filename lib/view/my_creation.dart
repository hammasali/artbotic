import 'package:artbotic/routes/routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_controller.dart';
import '../utils/app_const.dart';

class MyCreation extends StatelessWidget {
  MyCreation({super.key});

  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return ListView.separated(
          shrinkWrap: true,
          itemCount: controller.generatedImages.length,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (_, index) {
            final currentIndex = controller.generatedImages.length - 1 - index;
            final generatedImagesModel =
                controller.generatedImages[currentIndex];
            return InkWell(
                onTap: () => navigatorKey.currentState!.pushNamed(
                    PageRoutes.creationDetail,
                    arguments: generatedImagesModel),
                child: _customTile(context, generatedImagesModel));
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20));
    }));
  }

  _customTile(context, generatedImagesModel) {
    return Container(
        height: Get.height * 0.25,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).hintColor),
            borderRadius: BorderRadius.circular(16)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// AI IMAGE VIEW
          _leadingImage(context, generatedImagesModel),

          /// PROMPT
          _bodyContent(context, generatedImagesModel)
        ]));
  }

  _leadingImage(context, generatedImagesModel) {
    return Container(
        width: 160,
        height: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).hintColor),
            borderRadius: BorderRadius.circular(16)),
        child: Hero(
          tag: generatedImagesModel.id!,
          child: ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  imageUrl: generatedImagesModel.output!.first,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                          child: CircularProgressIndicator.adaptive()))),
        ));
  }

  _bodyContent(context, generatedImagesModel) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(generatedImagesModel.prompt!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 13),
              Row(children: [
                /// VARIATION BUTTON
                _variationBtn(context),
                const SizedBox(width: 18),

                /// DELETE BUTTON
                _deleteBtn(context, generatedImagesModel),
              ])
            ])));
  }

  _variationBtn(context) {
    return Image(
        image: const AssetImage(AppConsts.variation),
        height: 22,
        width: 22,
        color: Theme.of(context).iconTheme.color);
  }

  _deleteBtn(context, generatedImagesModel) {
    return InkWell(
      onTap: () => controller.deleteItem(generatedImagesModel.id),
      child: Image(
          image: const AssetImage(AppConsts.bin),
          height: 22,
          width: 22,
          color: Theme.of(context).iconTheme.color),
    );
  }
}

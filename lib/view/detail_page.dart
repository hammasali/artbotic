import 'package:artbotic/config/theme.dart';
import 'package:artbotic/controllers/create_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/view/components/sheets/image_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../model/Image_generation_model.dart';
import '../utils/app_const.dart';

class CreationDetailPage extends StatelessWidget {
  CreationDetailPage({super.key, required this.imageGenerationModel});

  final ImageGenerationModel imageGenerationModel;
  final CreateController controller = Get.find<CreateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(context),
        body: ListView(children: [
          ///  SHOW AI IMAGES
          getImages(context),
          const SizedBox(height: 20),

          /// FEATURES BUTTONS ACTIONS
          featuredButtons(context),
          const SizedBox(height: 10),
          const Divider(),

          /// AI IMAGE PROMPT AND COPY ACTION
          getPrompt(context),

          /// SETTINGS
          getSettings(context),
        ]));
  }

  getImages(BuildContext context) {
    return Obx(() => Stack(alignment: Alignment.center, children: [
          CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  height: Get.height * 0.7,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlayAnimationDuration: const Duration(seconds: 5),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPageChanged: (index, _) =>
                      controller.currentImageIndex.value = index),
              items: imageGenerationModel.output!
                  .map((e) => GestureDetector(
                      onTap: () => showDetailImage(e),
                      child: Hero(
                        tag: imageGenerationModel.id!,
                        child: ClipRRect(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(30)),
                            child: ShaderMask(
                                shaderCallback: (Rect bounds) =>
                                    const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black54
                                        ],
                                        stops: [
                                          0.6,
                                          1.0
                                        ]).createShader(bounds),
                                blendMode: BlendMode.darken,
                                child: CachedNetworkImage(
                                    imageUrl: e,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        const Center(
                                            child: CircularProgressIndicator.adaptive())))),
                      )))
                  .toList()),
          Positioned(
              bottom: 12,
              child: DotsIndicator(
                  dotsCount: 4,
                  position: controller.currentImageIndex.value,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: const DotsDecorator(
                      size: Size.square(18),
                      activeSize: Size.square(18),
                      color: AppTheme.whiteColor,
                      activeColor: AppTheme.purpleColor)))
        ]));
  }

  getAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
            icon: Icon(Icons.close, color: Theme.of(context).iconTheme.color!),
            onPressed: () => navigatorKey.currentState!.pop()),
        actions: [
          InkWell(
              onTap: () async => await MediaDownload().downloadMedia(
                  context,
                  imageGenerationModel
                      .output![controller.currentImageIndex.value]),
              child: Image(
                  color: Theme.of(context).iconTheme.color,
                  image: const AssetImage(AppConsts.download),
                  width: 30,
                  height: 30)),
          const SizedBox(width: 10)
        ]);
  }

  featuredButtons(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: AppConsts.features.entries
            .map((e) => Column(children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).iconTheme.color!),
                          shape: BoxShape.circle),
                      child: Image(
                          color: Theme.of(context).iconTheme.color,
                          image: AssetImage(e.key),
                          height: 22,
                          width: 22)),
                  const SizedBox(height: 5),
                  Text(e.value, style: Theme.of(context).textTheme.bodyMedium)
                ]))
            .toList());
  }

  getPrompt(BuildContext context) {
    final s = S.of(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _headingText(S.of(Get.context!).prompt, context),
        InkWell(
            onTap: () {
              Clipboard.setData(
                  ClipboardData(text: imageGenerationModel.prompt!));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(s.textCopiedToClipboard)));
            },
            child: const Icon(Icons.copy, size: 20))
      ]),
      const SizedBox(height: 8),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Text(imageGenerationModel.prompt!,
              style: Theme.of(context).textTheme.displayMedium)),
      const Divider(),
      const SizedBox(height: 10)
    ]);
  }

  getSettings(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _headingText('Settings', context),
      const SizedBox(height: 10),
      _modelName(context),
      const Divider(),
      _steps(context),
      const Divider(),
      _scale(context),
      const Divider(),
      _negativePrompt(context),
      const Divider(),
      _seed(context),
      const Divider(),
      _initImage(context),
      const SizedBox(height: 15)
    ]);
  }

  _headingText(String s, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(s,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 24)));
  }

  _modelName(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Model', style: Theme.of(context).textTheme.bodyLarge),
          Text(imageGenerationModel.modelName!,
              style: Theme.of(context).textTheme.bodyLarge)
        ]));
  }

  _steps(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Steps', style: Theme.of(context).textTheme.bodyLarge),
          Text(imageGenerationModel.steps!,
              style: Theme.of(context).textTheme.bodyLarge)
        ]));
  }

  _scale(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Scale', style: Theme.of(context).textTheme.bodyLarge),
          Text(imageGenerationModel.guidanceScale.toString(),
              style: Theme.of(context).textTheme.bodyLarge)
        ]));
  }

  _negativePrompt(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Negative Prompt', style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          Flexible(
              child: Text(
                  imageGenerationModel.negativePrompt!.isEmpty
                      ? 'N/A'
                      : imageGenerationModel.negativePrompt!,
                  style: Theme.of(context).textTheme.bodyLarge))
        ]));
  }

  _seed(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Seed', style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          Flexible(
              child: Text(imageGenerationModel.seed!,
                  style: Theme.of(context).textTheme.bodyLarge))
        ]));
  }

  _initImage(context) {
    if (imageGenerationModel.initImage == null) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Image', style: Theme.of(context).textTheme.bodyLarge),
            Text('N/A', style: Theme.of(context).textTheme.bodyLarge)
          ]));
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 14),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Image', style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                      imageUrl: imageGenerationModel.maskImage ??
                          imageGenerationModel.initImage!,
                      fit: BoxFit.contain,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const Center(
                              child: CircularProgressIndicator.adaptive()))))
        ]));
  }
}

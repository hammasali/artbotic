import 'package:artbotic/config/theme.dart';
import 'package:artbotic/controllers/create_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/view/components/sheets/image_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.close,
                    color: Theme.of(context).iconTheme.color!),
                onPressed: () => navigatorKey.currentState!.pop()),
            actions: [
              Image(
                  color: Theme.of(context).iconTheme.color,
                  image: const AssetImage(AppConsts.download),
                  width: 30,
                  height: 30),
              const SizedBox(width: 10)
            ]),
        body: ListView(children: [
          ///====== SHOW AI IMAGES
          getImages(context),
          const SizedBox(height: 20),
          Row(
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
                        Text(e.value,
                            style: Theme.of(context).textTheme.bodyMedium)
                      ]))
                  .toList()),
          const SizedBox(height: 10),
          const Divider(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(S.of(Get.context!).prompt,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24))),
          const Divider(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  'The signingConfig block is meant to specify the signing configuration for your release build type. If you havent defined a signing configuration for your release build in your build.gradle file, this error can occur',
                  style: Theme.of(context).textTheme.displayMedium)),
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
                      child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                          child: ShaderMask(
                              shaderCallback: (Rect bounds) => const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black54],
                                  stops: [0.6, 1.0]).createShader(bounds),
                              blendMode: BlendMode.darken,
                              child: CachedNetworkImage(
                                  imageUrl: e,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) => const Center(
                                          child: CircularProgressIndicator.adaptive()))))))
                  .toList()),
          Positioned(
              bottom: 12,
              child: DotsIndicator(
                  dotsCount: imageGenerationModel.output!.length,
                  position: controller.currentImageIndex.value,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: const DotsDecorator(
                      size: Size.square(18),
                      activeSize: Size.square(18),
                      color: AppTheme.whiteColor,
                      activeColor: AppTheme.purpleColor)))
        ]));
  }
}

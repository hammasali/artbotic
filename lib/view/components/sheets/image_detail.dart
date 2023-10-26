import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_const.dart';

showDetailImage(String image) {
  return showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => Stack(children: [
            CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(child: CircularProgressIndicator.adaptive())),
            Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color!.withOpacity(0.4),
                    child: IconButton(
                        icon: Icon(Icons.close,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        onPressed: () =>
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog')))),
            Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).iconTheme.color!.withOpacity(0.4),
                    child: Image(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        image: const AssetImage(AppConsts.download),
                        width: 25,
                        height: 25))),
          ]));
}

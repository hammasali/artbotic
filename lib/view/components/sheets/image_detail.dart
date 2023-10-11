import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';
import '../../../utils/app_const.dart';

showDetailImage() {
  final s = S.of(Get.context!);

  return showModalBottomSheet(
      context: Get.context!,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (BuildContext context) => Stack(children: [
            Image.asset(
                fit: BoxFit.cover,
                AppConsts.iconSquare,
                width: double.infinity,
                height: double.infinity),
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

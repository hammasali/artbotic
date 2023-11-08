import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';

enum DiffusionApiType { textToImage, imageToImage, inPainting }

double get screenHeight =>
    MediaQuery.of(Get.context!).size.height -
    MediaQuery.of(Get.context!).padding.top -
    MediaQuery.of(Get.context!).padding.bottom;

final GlobalKey repaintBoundaryKey = GlobalKey();

getLoader([String? msg]) =>
    EasyLoading.show(status: msg ?? S.of(Get.context!).loading);

getSuccess() => EasyLoading.showSuccess(S.of(Get.context!).success);

getError(String error) =>
    EasyLoading.showError('${S.of(Get.context!).error}: $error');

getToast(String message) => EasyLoading.showToast(message,
    toastPosition: EasyLoadingToastPosition.top,
    dismissOnTap: true,
    maskType: EasyLoadingMaskType.clear);

dismissLoader() => EasyLoading.dismiss(animation: true);

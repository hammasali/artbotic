import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

double get screenHeight =>
    MediaQuery.of(Get.context!).size.height -
    MediaQuery.of(Get.context!).padding.top -
    MediaQuery.of(Get.context!).padding.bottom;

getLoader([String? msg]) => EasyLoading.show(status: msg ?? 'Loading...');

getSuccess() => EasyLoading.showSuccess('Success');

getError(String error) => EasyLoading.showError('Error: $error');

dismissLoader() => EasyLoading.dismiss(animation: true);

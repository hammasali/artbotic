import 'package:flutter/material.dart';
import 'package:get/get.dart';

double get screenHeight =>
    MediaQuery.of(Get.context!).size.height -
    MediaQuery.of(Get.context!).padding.top -
    MediaQuery.of(Get.context!).padding.bottom;

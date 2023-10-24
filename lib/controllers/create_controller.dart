import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:artbotic/controllers/api_controller.dart';
import 'package:artbotic/data/app_data.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme.dart';
import '../routes/routes.dart';

class CreateController extends GetxController {
  var isTextSelected = true.obs;
  var isImageSelected = false.obs;
  var isInPantingSelected = false.obs;

  var selectedIndex = 0.obs;
  var sliderIterations = 21.obs;
  var sliderScaling = 7.obs;
  var currentImageIndex = 0.obs;
  final TextEditingController negPromptController = TextEditingController();
  final TextEditingController seedController = TextEditingController(text: '0');

  final TextEditingController promptController = TextEditingController();
  var isClearText = false.obs;

  var isMaskSelected = true.obs;
  var isEraseSelected = false.obs;
  var points = <Offset?>[];
  var currentDrawingColor = AppTheme.whiteColor.obs;
  var strokeWidth = 15.0.obs;

  File? imageFile;
  var imageUrl = Rx<String?>(null);

  var selectedTagIndex = 0.obs;
  var selectedTags = <String>[].obs;

  var selectedStyleIndex = 0.obs;
  var selectedStyleModalName = 'SDXL'.obs;

  @override
  void dispose() {
    promptController.dispose();
    negPromptController.dispose();
    seedController.dispose();
    super.dispose();
  }

  defaultSettings() {
    selectedIndex.value = 0;
    sliderIterations.value = 21;
    sliderScaling.value = 7;
    currentImageIndex.value = 0;
    negPromptController.clear();
    seedController.text = '0';

    promptController.clear();
    isClearText.value = false;

    isMaskSelected.value = true;
    isEraseSelected.value = false;
    points = <Offset?>[];
    currentDrawingColor.value = AppTheme.whiteColor;
    strokeWidth.value = 15.0;

    imageFile = null;
    imageUrl.value = null;

    selectedTagIndex.value = 0;
    selectedTags.value = <String>[];

    selectedStyleIndex.value = 0;
    selectedStyleModalName.value = 'SDXL';
  }

  void pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = File(image.path);
      if (isInPantingSelected.value) {
        navigatorKey.currentState!.pushNamed(PageRoutes.inPainting);
      } else if (isImageSelected.value) {
        String base64String = base64Encode(imageFile!.readAsBytesSync());
        await uploadBase64EncodedImage(base64String);
      }
    }
  }

  shouldShowClearTextIcon(String value) {
    if (value.isNotEmpty) {
      isClearText.value = true;
    } else {
      isClearText.value = false;
    }
  }

  updateTextFieldWithRandomInspiration() {
    final random = Random();
    final randomIndex = random.nextInt(AppDataSet.arrayOfInspirations.length);
    promptController.text = AppDataSet.arrayOfInspirations[randomIndex];
    isClearText.value = true;
  }

  void addPoint(Offset point) {
    points.add(point);
    update();
  }

  void clearPoints() {
    points.clear();
    isMaskSelected.value = false;
    isEraseSelected.value = true;
    update();
  }

  void enabledDrawing() {
    isMaskSelected.value = true;
    isEraseSelected.value = false;
  }

  resetImage() {
    imageFile = null;
    points.clear();
    imageUrl.value = null;
  }

  Future<String> renderedImageAndGetMergedImageToBase64(
      GlobalKey<State<StatefulWidget>> repaintBoundaryKey) async {
    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List unit8list = byteData!.buffer.asUint8List();
    return base64Encode(unit8list);
  }

  uploadBase64EncodedImage(String image) async {
    try {
      getLoader('Uploading Image...');
      var json = await ApiController().uploadImage(image);
      imageUrl.value = json['link'];
      debugPrint(imageUrl.value.toString());
      dismissLoader();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}

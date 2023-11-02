import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:artbotic/controllers/api_controller.dart';
import 'package:artbotic/data/app_data.dart';
import 'package:artbotic/model/Styles_model.dart';
import 'package:artbotic/services/pref_provider.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme.dart';
import '../model/Image_generation_model.dart';
import '../routes/routes.dart';

class CreateController extends GetxController {
  var isTextSelected = true.obs;
  var isImageSelected = false.obs;
  var isInPantingSelected = false.obs;
  var diffusionApiType = DiffusionApiType.textToImage;

  var selectedAspectRatioIndex = 0.obs;
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
  var initImageUrl = Rx<String?>(null);
  var maskImageUrl = Rx<String?>(null);

  var selectedTagIndex = 0.obs;
  var selectedTags = <String>[].obs;

  var selectedStyleIndex = 0.obs;
  var selectedStyleModalName = 'SDXL'.obs;
  StylesModel selectedStyleModel =
      StylesModel.fromJson(AppDataSet.styleModels.first);

  var generatedImages = <ImageGenerationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    generatedImages.value = PrefProvider().getImagesFromPref();
  }

  @override
  void dispose() {
    promptController.dispose();
    negPromptController.dispose();
    seedController.dispose();
    super.dispose();
  }

  defaultSettings() {
    selectedAspectRatioIndex.value = 0;
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
    initImageUrl.value = null;
    maskImageUrl.value = null;

    selectedTagIndex.value = 0;
    selectedTags.value = <String>[];

    selectedStyleIndex.value = 0;
    selectedStyleModalName.value = 'SDXL';
    selectedStyleModel = StylesModel.fromJson(AppDataSet.styleModels.first);
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
    initImageUrl.value = null;
    maskImageUrl.value = null;
  }

  pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = File(image.path);
      if (isInPantingSelected.value) {
        navigatorKey.currentState!.pushNamed(PageRoutes.inPainting);
      } else if (isImageSelected.value) {
        String base64String = base64Encode(imageFile!.readAsBytesSync());
        await _uploadBase64EncodedImage(base64String);
      }
    }
  }

  applyInPainting() async {
    if (points.isNotEmpty) {
      String maskedBase64String =
          await _renderedImageAndGetMergedImageToBase64(repaintBoundaryKey);
      await _uploadBase64EncodedMaskedImage(maskedBase64String);
      String initBase64String = base64Encode(imageFile!.readAsBytesSync());
      await _uploadBase64EncodedImage(initBase64String);
      points.clear();
      navigatorKey.currentState!.pop();
    }
  }

  Future<String> _renderedImageAndGetMergedImageToBase64(
      GlobalKey<State<StatefulWidget>> repaintBoundaryKey) async {
    RenderRepaintBoundary boundary = repaintBoundaryKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List unit8list = byteData!.buffer.asUint8List();
    return base64Encode(unit8list);
  }

  _uploadBase64EncodedMaskedImage(String maskImage) async {
    try {
      getLoader('Applying Mask...');
      var json = await ApiController().uploadImage(maskImage);
      maskImageUrl.value = json['link'];
      debugPrint(maskImageUrl.value.toString());
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  _uploadBase64EncodedImage(String image) async {
    try {
      getLoader('Uploading Image...');
      var json = await ApiController().uploadImage(image);
      initImageUrl.value = json['link'];
      debugPrint(initImageUrl.value.toString());
      dismissLoader();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  generateImage() async {
    try {
      if (promptController.text.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 700),
            content: Text('Prompt is required to generate images')));
      } else {
        getLoader('Generation is in progress...');
        var json = await _hitEndPoint();
        List<String> outputs = [];

        /// STATUS >>> PROCESSING

        if (json['status'] == 'processing') {
          await FirebaseMessaging.onMessage.first.then((RemoteMessage message) {
            final result = jsonDecode(message.data['body']);
            outputs = (result['output'] as List)
                .map((item) => item.toString())
                .toList();
            _updateLocalDB(json, outputs);
          });
        }

        /// STATUS >>> SUCCESS

        else if (json['status'] == 'success') {
          outputs =
              (json['output'] as List).map((item) => item.toString()).toList();
          _updateLocalDB(json, outputs);
        }

        /// STATUS >>> FAILED

        else if (json['status'] == 'failed') {
          throw 'Failed: Try Again';
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  Future _hitEndPoint() async {
    String endpoint = {
          DiffusionApiType.imageToImage: 'v3/img2img',
          DiffusionApiType.inPainting: 'v3/inpaint',
        }[diffusionApiType] ??
        'v4/dreambooth';

    ImageGenerationModel imageGenerateModel = ImageGenerationModel(
        prompt: promptController.text,
        canvasPos: selectedAspectRatioIndex.value,
        guidanceScale: sliderScaling.value.toDouble(),
        numInferenceSteps: sliderIterations.value.toString(),
        steps: sliderIterations.value.toString(),
        modelId: selectedStyleModel.modelId!,
        modelName: selectedStyleModel.modelName!,
        initImage: initImageUrl.value,
        maskImage: maskImageUrl.value,
        negativePrompt: AppDataSet.negativePrompt + negPromptController.text,
        endpoint: endpoint,
        seed: seedController.text,
        token: PrefProvider().getFCMToken());

    return await ApiController().generateImage(imageGenerateModel.toJson());
  }

  _updateLocalDB(json, List<String> outputs) {
    ImageGenerationModel generatedImagesModel =
        ImageGenerationModel.generatedImages(
            id: json['id'],
            prompt: promptController.text,
            canvasPos: selectedAspectRatioIndex.value,
            guidanceScale: sliderScaling.value.toDouble(),
            numInferenceSteps: sliderIterations.value.toString(),
            steps: sliderIterations.value.toString(),
            modelId: selectedStyleModel.modelId!,
            modelName: selectedStyleModel.modelName!,
            initImage: initImageUrl.value,
            maskImage: maskImageUrl.value,
            negativePrompt: negPromptController.text,
            seed: seedController.text,
            output: outputs,
            status: json['status'],
            generationTime: json['generationTime']);
    generatedImages.add(generatedImagesModel);
    PrefProvider().saveImagesToPref(generatedImages);
    getSuccess();
    navigatorKey.currentState!
        .pushNamed(PageRoutes.creationDetail, arguments: generatedImagesModel);
  }

  deleteItem(int id) async {
    generatedImages.removeWhere((item) => item.id == id);
    await PrefProvider().saveImagesToPref(generatedImages);
  }
}

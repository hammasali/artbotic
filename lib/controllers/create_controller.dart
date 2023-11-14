import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:artbotic/controllers/api_controller.dart';
import 'package:artbotic/data/app_data.dart';
import 'package:artbotic/model/Styles_model.dart';
import 'package:artbotic/model/upscale_model.dart';
import 'package:artbotic/services/pref_provider.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/theme.dart';
import '../generated/l10n.dart';
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

  deleteItem(int id) async {
    getToast(S.of(Get.context!).deleted);
    generatedImages.removeWhere((item) => item.id == id);
    await PrefProvider().saveImagesToPref(generatedImages);
  }

  downloadImage(String imageUrl) async {
    getToast(S.of(Get.context!).downloading);
    await MediaDownload().downloadMedia(Get.context!, imageUrl);
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
      getLoader(S.of(Get.context!).applyingMask);
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
      getLoader(S.of(Get.context!).uploadingImage);
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
        ScaffoldMessenger.of(Get.context!).showSnackBar( SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(S.of(Get.context!).promptIsRequired)));
      } else {
        getLoader(S.of(Get.context!).generationInProgress);

        var json = await _hitEndPoint(false);

        _processStatus(json);
      }
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  generateImageVariations(
      ImageGenerationModel model, bool isThumbnailImage) async {
    try {
      getLoader(S.of(Get.context!).generationInProgress);
      String initImage = isThumbnailImage
          ? model.output!.first
          : model.output![currentImageIndex.value];

      var json = await _hitEndPoint(true, model: model, initImage: initImage);

      _processStatus(json, model: model, initImage: initImage);
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  Future _hitEndPoint(bool isVariation,
      {ImageGenerationModel? model, String? initImage}) async {
    String endpoint = isVariation
        ? 'v3/img2img'
        : {
              DiffusionApiType.imageToImage: 'v3/img2img',
              DiffusionApiType.inPainting: 'v3/inpaint',
            }[diffusionApiType] ??
            'v4/dreambooth';

    ImageGenerationModel imageGenerateModel = ImageGenerationModel(
        prompt: model?.prompt ?? promptController.text,
        canvasPos: model?.canvasPos ?? selectedAspectRatioIndex.value,
        guidanceScale: model?.guidanceScale ?? sliderScaling.value.toDouble(),
        numInferenceSteps:
            model?.numInferenceSteps ?? sliderIterations.value.toString(),
        steps: model?.steps ?? sliderIterations.value.toString(),
        modelId: model?.modelId ?? selectedStyleModel.modelId!,
        modelName: model?.modelName ?? selectedStyleModel.modelName!,
        initImage: initImage ?? initImageUrl.value,
        maskImage: model?.maskImage ?? maskImageUrl.value,
        negativePrompt: AppDataSet.negativePrompt +
            (model?.negativePrompt ?? negPromptController.text),
        endpoint: endpoint,
        seed: model?.seed ?? seedController.text,
        strength: isVariation ? 0.7 : 0.1,
        type: Platform.isAndroid ? 'a' : 'i',
        token: PrefProvider().getFCMToken());

    return await ApiController().generateImage(imageGenerateModel.toJson());
  }

  _processStatus(json, {ImageGenerationModel? model, String? initImage}) async {
    try {
      List<String> outputs = [];

      /// STATUS >>> PROCESSING

      if (json['status'] == 'processing') {
        await FirebaseMessaging.onMessage.first.then((RemoteMessage message) {
          final result = jsonDecode(message.data['body']);
          outputs = (result['output'] as List)
              .map((item) => item.toString())
              .toList();
          _updateLocalDB(json, outputs, model: model, initImage: initImage);
        });
      }

      /// STATUS >>> SUCCESS

      else if (json['status'] == 'success') {
        outputs =
            (json['output'] as List).map((item) => item.toString()).toList();
        _updateLocalDB(json, outputs, model: model, initImage: initImage);
      }

      /// STATUS >>> FAILED

      else if (json['status'] == 'failed') {
        throw 'Failed: Try Again';
      }
    } catch (e) {
      rethrow;
    }
  }

  _updateLocalDB(json, List<String> outputs,
      {ImageGenerationModel? model, String? initImage}) {
    ImageGenerationModel generatedImagesModel =
        ImageGenerationModel.generatedImages(
            id: json['id'],
            prompt: model?.prompt ?? promptController.text,
            canvasPos: model?.canvasPos ?? selectedAspectRatioIndex.value,
            guidanceScale:
                model?.guidanceScale ?? sliderScaling.value.toDouble(),
            numInferenceSteps:
                model?.steps ?? sliderIterations.value.toString(),
            steps: model?.steps ?? sliderIterations.value.toString(),
            modelId: model?.modelId ?? selectedStyleModel.modelId!,
            modelName: model?.modelName ?? selectedStyleModel.modelName!,
            initImage: initImage ?? initImageUrl.value,
            maskImage: model?.maskImage ?? maskImageUrl.value,
            negativePrompt: model?.negativePrompt ?? negPromptController.text,
            seed: model?.seed ?? seedController.text,
            output: outputs,
            status: json['status'],
            generationTime: json['generationTime']);
    generatedImages.add(generatedImagesModel);
    PrefProvider().saveImagesToPref(generatedImages);
    getSuccess();
    navigatorKey.currentState!
        .pushNamed(PageRoutes.creationDetail, arguments: generatedImagesModel);
  }

  generateEvolvedImages(ImageGenerationModel model) {
    defaultSettings();
    initImageUrl.value = model.output![currentImageIndex.value];
    promptController.text = model.prompt!;
    isClearText.value = true;
    isTextSelected.value = false;
    isImageSelected.value = true;
    isInPantingSelected.value = false;
    diffusionApiType = DiffusionApiType.imageToImage;
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(PageRoutes.landing, (route) => false);
  }

  generateUpscaleImage(ImageGenerationModel model) async {
    try {
      getLoader(S.of(Get.context!).upscalingInProgress);
      int selectedImageIndex = currentImageIndex.value;
      String selectedImageUrl = model.output![selectedImageIndex];

      UpscaleModel upscaleModel = UpscaleModel(
          faceEnhance: false,
          scale: 3,
          imageUrl: selectedImageUrl,
          endpoint: 'super_resolution',
          webhook: "https://edecator.com/aiApp/weebhook.php",
          firebaseToken: PrefProvider().getFCMToken()!);

      var json = await ApiController().upscaleImage(upscaleModel.toJson());

      String upscaleImage = json['output'];
      final index = generatedImages.indexWhere((img) => img.id == model.id);
      generatedImages[index].output![selectedImageIndex] = upscaleImage;
      generatedImages.refresh();

      await PrefProvider().saveImagesToPref(generatedImages);
      dismissLoader();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}

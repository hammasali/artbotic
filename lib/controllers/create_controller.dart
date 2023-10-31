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
  var imageUrl = Rx<String?>(null);

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
    // generatedImages.value = PrefProvider().getImagesFromPref();
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
    imageUrl.value = null;

    selectedTagIndex.value = 0;
    selectedTags.value = <String>[];

    selectedStyleIndex.value = 0;
    selectedStyleModalName.value = 'SDXL';
    selectedStyleModel = StylesModel.fromJson(AppDataSet.styleModels.first);
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

  generateImage() async {
    try {
      if (promptController.text.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
            duration: Duration(milliseconds: 700),
            content: Text('Prompt is required to generate images')));
      } else {
        getLoader('Generation is in progress...');

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
            initImage: imageUrl.value,
            negativePrompt:
                AppDataSet.negativePrompt + negPromptController.text,
            endpoint: endpoint,
            seed: seedController.text,
            token: PrefProvider().getFCMToken());

        debugPrint(imageGenerateModel.toJson().toString(), wrapWidth: 1024);

        var json =
            await ApiController().generateImage(imageGenerateModel.toJson());

        List<String> outputs = [];
        if (json['status'] == 'processing') {
          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
            final result = jsonDecode(message.data['body']);

            outputs = (result['output'] as List)
                .map((item) => item.toString())
                .toList();

            _updateLocalDB(json, outputs);
          });
        } else if (json['status'] == 'success') {
          outputs =
              (json['output'] as List).map((item) => item.toString()).toList();
          _updateLocalDB(json, outputs);
        } else if (json['status'] == 'failed') {
          throw 'Failed: Try Again';
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
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
            initImage: imageUrl.value,
            negativePrompt:
                AppDataSet.negativePrompt + negPromptController.text,
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
}

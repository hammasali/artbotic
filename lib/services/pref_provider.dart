import 'package:artbotic/model/Image_generation_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../config/preferences.dart';

class PrefProvider {
  static final PrefProvider _instance = PrefProvider._internal();

  PrefProvider._internal();

  factory PrefProvider() {
    return _instance;
  }

  Future<void> saveImagesToPref(List<ImageGenerationModel> images) async =>
      await Pref.setString(
          Pref.IMAGE_GEN_KEY, ImageGenerationModel.encode(images));

  List<ImageGenerationModel> getImagesFromPref() {
    final String? decodedStr = Pref.getString(Pref.IMAGE_GEN_KEY);
    return decodedStr == null ? [] : ImageGenerationModel.decode(decodedStr);
  }

  String? getFCMToken() {
    final String? token = Pref.getString(Pref.TOKEN);
    return token;
  }

   setFCMToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    await Pref.setString(Pref.TOKEN, token!);
  }
}

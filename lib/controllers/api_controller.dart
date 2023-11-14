import 'dart:convert';

import 'package:artbotic/model/feedback_model.dart';
import 'package:artbotic/utils/app_const.dart';

import '../services/api_service.dart';

class ApiController {
  Future<dynamic> uploadImage(String base64Image) async {
    String param = jsonEncode(
        {'image': 'data:image/png;base64,$base64Image', 'crop': 'false'});

    try {
      return await Api()
          .post_('${AppConsts.baseUrl}upload_img.php', params: param);
    } catch (e) {
      rethrow;
    }
  }

  generateImage(Map<String, dynamic> data) async {
    try {
      return await Api()
          .post_('${AppConsts.baseUrl}api.php', params: jsonEncode(data));
    } catch (e) {
      rethrow;
    }
  }

  upscaleImage(Map<String, dynamic> data) async {
    try {
      return await Api()
          .post_('${AppConsts.baseUrl}super_r.php', params: jsonEncode(data));
    } catch (e) {
      rethrow;
    }
  }

  feedback(FeedbackModel data) async {
    try {
      return await Api().post_('${AppConsts.baseUrl}post_feedback.php',
          params: jsonEncode(data.toJson()));
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:convert';

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
}

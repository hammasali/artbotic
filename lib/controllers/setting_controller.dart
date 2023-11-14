import 'package:artbotic/controllers/api_controller.dart';
import 'package:artbotic/model/feedback_model.dart';
import 'package:artbotic/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/globals.dart';

class SettingController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
  }

  feedBack() async {
    try {
      if (nameController.text.isEmpty) throw 'Please provide name';
      if (emailController.text.isEmpty) throw 'Please provide email';
      if (messageController.text.isEmpty) throw 'Please write query';

      getLoader();
      await ApiController().feedback(FeedbackModel(
          email: emailController.text,
          name: nameController.text,
          subject: 'Query',
          message: messageController.text));

      nameController.text = '';
      emailController.text = '';
      messageController.text = '';
      Navigator.of(Get.context!, rootNavigator: true).pop('dialog');
      getSuccess();
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }

  privacyPolicy() async {
    try {
      var url = Uri.parse(AppConsts.privacyPolicyUrl);

      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint(e.toString());
      getError(e.toString());
    }
  }
}

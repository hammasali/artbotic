import 'package:get/get.dart';

import '../utils/app_const.dart';

class CreateController extends GetxController {
  var isTextSelected = true.obs;
  var isImageSelected = false.obs;
  var isInPantingSelected = false.obs;
  var selectedIndex = 0.obs;
  var slider1 = 0.0.obs;
  var slider2 = 0.0.obs;
  var currentImageIndex = 0.obs;

  final Map<String, String> options = {
    AppConsts.oneToOne: '1 : 1',
    AppConsts.nineToSix: '9 : 16',
    AppConsts.fourToFive: '4 : 5',
    AppConsts.fourToThree: '4 : 3',
    AppConsts.fiveToThree: '5 : 3',
  };
}

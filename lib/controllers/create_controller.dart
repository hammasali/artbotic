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
  var selectedTags = <String>[].obs;
  var dummyData = [
    "Lorem",
    "ipsum",
    "dolor",
    "sit",
    "amet",
    "consectetur",
    "adipiscing",
    "elit",
    "sed",
    "do",
    "eiusmod",
    "tempor",
    "incididunt",
    "ut",
    "labore",
    "et",
    "dolore",
    "magna",
    "aliqua",
    "Ut",
    "enim",
    "ad",
    "minim",
    "veniam",
    "quis",
    "nostrud",
    "exercitation",
    "ullamco",
    "laboris",
    "nisi",
    "ut",
    "aliquip",
    "ex",
    "ea",
    "commodo",
    "consequat",
    "Duis",
    "aute",
    "irure",
    "dolor",
    "in",
    "reprehenderit",
    "in",
    "voluptate",
    "velit",
    "esse",
    "cillum",
    "dolore",
    "eu",
    "fugiat",
    "nulla",
    "pariatur",
    "Excepteur",
    "sint",
    "occaecat",
    "cupidatat",
    "non",
    "proident",
    "sunt",
    "in",
    "culpa",
    "qui",
    "officia",
    "deserunt",
    "mollit",
    "anim",
    "id",
    "est",
    "laborum"
  ];
}

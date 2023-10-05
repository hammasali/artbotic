import 'package:artbotic/config/theme.dart';
import 'package:artbotic/controllers/create_controller.dart';
import 'package:artbotic/view/components/buttons/custom_button3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../utils/app_const.dart';

class Create extends StatelessWidget {
  Create({super.key});

  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ListView(shrinkWrap: true, children: [
      Obx(() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomButton3(
                  isSelected: controller.isTextSelected.value,
                  text: 'Text',
                  icon: AppConsts.text,
                  onTap: () {
                    controller.isTextSelected.value = true;
                    controller.isImageSelected.value = false;
                    controller.isInPantingSelected.value = false;
                  }),
              const SizedBox(width: 10),
              CustomButton3(
                  isSelected: controller.isImageSelected.value,
                  text: 'Image',
                  icon: AppConsts.gallery,
                  onTap: () {
                    controller.isTextSelected.value = false;
                    controller.isImageSelected.value = true;
                    controller.isInPantingSelected.value = false;
                  }),
              const SizedBox(width: 10),
              CustomButton3(
                  isSelected: controller.isInPantingSelected.value,
                  text: 'Inpainting',
                  icon: AppConsts.inPainting,
                  onTap: () {
                    controller.isTextSelected.value = false;
                    controller.isImageSelected.value = false;
                    controller.isInPantingSelected.value = true;
                  })
            ]);
      }),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Enter Prompt',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20)),
            const SizedBox(height: 10),
            TextField(
                cursorColor: AppTheme.purpleColor,
                decoration: InputDecoration(
                    hintText: 'Write a lot of description here',
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    contentPadding: const EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0)),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor),
                minLines: 5,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                onChanged: (value) {
                  print(value);
                })
          ]))
    ]);
  }
}

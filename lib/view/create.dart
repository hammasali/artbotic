import 'package:artbotic/config/theme.dart';
import 'package:artbotic/controllers/create_controller.dart';
import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:artbotic/view/components/buttons/custom_button3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../utils/app_const.dart';
import 'components/dotted_border.dart';

class Create extends StatelessWidget {
  Create({super.key});

  final CreateController controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(shrinkWrap: true, children: [
        /// TAB BUTTONS
        tabButtons(),

        /// ADD IMAGE
        addImageContainer(),

        /// Enter PROMPT
        enterPromptContainer(),

        /// SELECT STYLES
        selectStyles(),

        ///ADVANCE SETTINGS
        advanceSettings(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
              title: 'Generate',
              borderRadius: 8,
              icon: AppConsts.brush,
              onTap: () {}),
        ),
        const SizedBox(height: 15)
      ]);
    });
  }

  tabButtons() {
    final s = S.of(Get.context!);

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
              text: s.image,
              icon: AppConsts.gallery,
              onTap: () {
                controller.isTextSelected.value = false;
                controller.isImageSelected.value = true;
                controller.isInPantingSelected.value = false;
              }),
          const SizedBox(width: 10),
          CustomButton3(
              isSelected: controller.isInPantingSelected.value,
              text: s.inpainting,
              icon: AppConsts.inPainting,
              onTap: () {
                controller.isTextSelected.value = false;
                controller.isImageSelected.value = false;
                controller.isInPantingSelected.value = true;
              })
        ]);
  }

  addImageContainer() {
    final s = S.of(Get.context!);
    if (controller.isTextSelected.value == true) {
      return const SizedBox.shrink();
    }

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.addImage,
              style: Theme.of(Get.context!)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.darkAccentColor),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(Get.context!).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Image(
                            image: const AssetImage(AppConsts.upload),
                            color: Theme.of(Get.context!).iconTheme.color,
                            height: 25,
                            width: 25)),
                    Stack(alignment: Alignment.center, children: [
                      const SizedBox(
                          height: 120,
                          width: 100,
                          child: DashedRect(
                              color: AppTheme.purpleColor,
                              strokeWidth: 2.0,
                              gap: 3.0)),
                      Column(children: [
                        Image(
                            image: const AssetImage(AppConsts.addImage),
                            color: Theme.of(Get.context!).iconTheme.color,
                            height: 25,
                            width: 25),
                        const SizedBox(height: 10),
                        Text(s.uploadImage,
                            style: Theme.of(Get.context!).textTheme.bodySmall)
                      ])
                    ]),
                    Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Theme.of(Get.context!).primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Image(
                            image: const AssetImage(AppConsts.crop),
                            color: Theme.of(Get.context!).iconTheme.color,
                            height: 25,
                            width: 25))
                  ]))
        ]));
  }

  enterPromptContainer() {
    final s = S.of(Get.context!);

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.enterPrompt,
              style: Theme.of(Get.context!)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.darkAccentColor),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Image(
                                  image: AssetImage(AppConsts.edit),
                                  height: 18,
                                  width: 18)),
                          Expanded(
                              child: TextField(
                                  cursorColor: AppTheme.purpleColor,
                                  decoration: InputDecoration(
                                      hintText: s.description,
                                      hintStyle: Theme.of(Get.context!)
                                          .textTheme
                                          .bodyLarge,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 2.0)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent)),
                                      filled: true,
                                      fillColor: Colors.transparent),
                                  minLines: 5,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    print(value);
                                  }))
                        ]),
                    Row(children: [
                      const Image(
                          image: AssetImage(AppConsts.idea),
                          height: 24,
                          width: 24),
                      const SizedBox(width: 6),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.purpleColor),
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(children: [
                            Text(s.promptBuilder,
                                style:
                                    Theme.of(Get.context!).textTheme.bodySmall),
                            const SizedBox(width: 6),
                            const Image(
                                image: AssetImage(AppConsts.colors),
                                height: 12,
                                width: 12)
                          ]))
                    ])
                  ]))
        ]));
  }

  selectStyles() {
    final s = S.of(Get.context!);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(s.selectStyles,
                style: Theme.of(Get.context!)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 20)),
            Text(s.seeAll, style: Theme.of(Get.context!).textTheme.bodyLarge)
          ]),
          const SizedBox(height: 10),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemCount: 6,
              // Total number of items
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8)));
              }),
          const SizedBox(height: 15)
        ]));
  }

  advanceSettings() {
    final s = S.of(Get.context!);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(s.advanceSettings,
              style: Theme.of(Get.context!)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          const CustomDropDown(),
          const SizedBox(height: 20)
        ]));
  }
}

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedOption,
        hint: Text('Choose settings',
            style: Theme.of(Get.context!).textTheme.bodyLarge),
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option,
                style: Theme.of(Get.context!).textTheme.bodyMedium),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        icon: Image(
            image: const AssetImage(AppConsts.arrowDown),
            color: Theme.of(Get.context!).iconTheme.color,
            height: 20,
            width: 20),
        underline: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

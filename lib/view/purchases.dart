import 'package:artbotic/view/components/buttons/custom_button4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme.dart';
import '../controllers/purchasing_controller.dart';
import '../generated/l10n.dart';
import '../utils/app_const.dart';
import 'components/buttons/custom_button.dart';

class Purchases extends StatelessWidget {
  Purchases({super.key});

  final PurchasingController controller = Get.put(PurchasingController());

  @override
  Widget build(BuildContext context) {
    final Map<String, String> items = {
      S.of(context).watchAdEarnGems: '2 Gems',
      'Rs 280': '20 Gems',
      'Rs 500': '40 Gems',
      'Rs 800': '100 Gems',
      'Rs 3500': '500 Gems',
      S.of(context).shareWithFriends: '20 Gems'
    };

    return Scaffold(
        body: SafeArea(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                children: <Widget>[
          const CustomButton4(),
          const SizedBox(height: 20),
          Text(S.of(context).chooseAPlan,
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 15),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final entry = items.entries.elementAt(index);

                return Obx(() {
                  final isSelected = controller.selectedPurchase.value == index;
                  return chooseAPlanTile(context, isSelected, entry, index, () {
                    controller.selectedPurchase.value = index;
                  });
                });
              },
              separatorBuilder: (_, index) => const SizedBox(height: 15)),
          const SizedBox(height: 25),

          /// BUTTON
          CustomButton(
              title: S.of(context).continueTxt,
              onTap: () {},
              verticalPadding: 4,
              borderRadius: 8,
              textStyle: Theme.of(context).textTheme.displayLarge)
        ])));
  }

  chooseAPlanTile(BuildContext context, bool isSelected,
      MapEntry<String, String> entry, int index, onTap) {
    return Stack(alignment: Alignment.center, children: [
      Column(children: [
        if (index == 4) const SizedBox(height: 10),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: isSelected
                        ? AppTheme.purpleColor
                        : Colors.transparent)),
            child: ListTile(
                onTap: onTap,
                title: Text(entry.key,
                    style: Theme.of(context).textTheme.titleMedium),
                contentPadding: const EdgeInsets.only(left: 30, right: 0),
                trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(children: [
                      Container(
                          height: double.infinity,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(13))),
                          child: Text(entry.value,
                              style: Theme.of(context).textTheme.bodyLarge)),
                      if (index == 0)
                        Positioned(
                            top: -50,
                            right: -100,
                            child: Transform.rotate(
                                angle: 10,
                                child: Container(
                                    height: 80,
                                    width: 200,
                                    color: AppTheme.pinkColor))),
                      if (index == 0)
                        const Positioned(
                            top: 0,
                            right: 0,
                            child: Image(
                                image: AssetImage(AppConsts.speaker),
                                height: 25,
                                width: 25))
                    ]))))
      ]),
      if (index == 4)
        const Positioned(
            top: 0,
            right: 5,
            child: Image(
                image: AssetImage(AppConsts.featured), height: 40, width: 40))
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';

selectSettingsModelSheet() {
  final s = S.of(Get.context!);

  return showModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      useSafeArea: true,
      builder: (BuildContext context) => DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 1.0,
          minChildSize: 0.5,
          builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Center(
                        child: Text(s.selectStyles,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20))),
                    Expanded(
                        child: GridView.builder(
                            controller: scrollController,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 22,
                                    crossAxisSpacing: 30),
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(22)));
                            }))
                  ]))));
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';

class MyCreation extends StatelessWidget {
  const MyCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            shrinkWrap: true,
            itemCount: 20,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, index) {
              return Container(
                  height: Get.height * 0.25,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).hintColor),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 160,
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                border: Border.all(
                                    color: Theme.of(context).hintColor),
                                borderRadius: BorderRadius.circular(16))),
                        Expanded(
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 15),
                                child: Column(children: [
                                  Text(
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      'This is a description text. It can have different styles within the same text block. This is a description text. It can have different styles within the same text block.This is a description text. It can have different styles within the same text block.This is a description text. It can have different styles within the same text block.This is a description text. It can have different styles within the same text block.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  const SizedBox(height: 13),
                                  Row(children: [
                                    Image(
                                        image:
                                            const AssetImage(AppConsts.refresh),
                                        height: 22,
                                        width: 22,
                                        color:
                                            Theme.of(context).iconTheme.color),
                                    const SizedBox(width: 18),
                                    Image(
                                        image: const AssetImage(AppConsts.bin),
                                        height: 22,
                                        width: 22,
                                        color:
                                            Theme.of(context).iconTheme.color)
                                  ])
                                ])))
                      ]));
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20)));
  }
}

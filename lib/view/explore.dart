import 'package:artbotic/view/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../utils/app_const.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// USER PROFILE INFORMATION
              _userInfo(context),

              /// USER POSTS
              _userPost(context),

              /// PROMPT AND ACTION
              _userPrompt(context)
            ]);
      },
      separatorBuilder: (context, index) =>
          Divider(color: Theme.of(context).highlightColor, thickness: 15),
    );
  }

  _userInfo(BuildContext context) {
    return ListTile(
        leading: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const ClipOval(
                child: Image(
                    height: 40,
                    width: 40,
                    image: AssetImage(AppConsts.iconRound),
                    fit: BoxFit.cover))),
        title: Text('Alizabth', style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text('Art Creater/ UX Designer'),
        trailing: const Icon(Icons.more_vert));
  }

  _userPost(BuildContext context) {
    return Image(
        image: const AssetImage(AppConsts.ai),
        height: 500,
        width: Get.width,
        fit: BoxFit.cover);
  }

  _userPrompt(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          _prompt(context),
          const SizedBox(width: 10),
          _tryMe(context)
        ]));
  }

  _prompt(BuildContext context) {
    return Flexible(
        child: Text(
            'Please note that translations can sometimes have variations, and context may influence the choice of words. If you have a specific context or usage in mind, feel free to let me know!',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge));
  }

  _tryMe(BuildContext context) {
    final s = S.of(context);

    return SizedBox(
        width: 70,
        child: CustomButton(
            title: s.tryMe,
            borderRadius: 8,
            verticalPadding: 4,
            textStyle: Theme.of(context).textTheme.bodyLarge,
            onTap: () {}));
  }
}

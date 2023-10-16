import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../generated/l10n.dart';
import '../../../routes/routes.dart';
import '../../../utils/app_const.dart';

class CustomButton4 extends StatelessWidget {
  const CustomButton4({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>
            navigatorKey.currentState!.pushNamed(PageRoutes.subscriptions),
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            height: 150,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFD961FF), Color(0xFF00EEFF)],
                    stops: [0.5186, 0.9779]),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(S.of(context).unlockAllTheAdvanceTxt,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppTheme.whiteColor),
                          textAlign: TextAlign.start)),
                  const Expanded(
                      child: Image(
                          image: AssetImage(AppConsts.crown),
                          height: 80,
                          width: 80))
                ])));
  }
}

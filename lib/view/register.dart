import 'package:artbotic/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/l10n.dart';
import '../routes/routes.dart';
import 'components/buttons/custom_button.dart';
import 'components/buttons/custom_button2.dart';
import 'components/fields/custom_fields.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              /// HEADER
              Image.asset(AppConsts.icon, width: 150, height: 150),
              SizedBox(height: Get.height * 0.02),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(s.newUsersRegisterHere,
                      style: Theme.of(context).textTheme.titleLarge)),
              SizedBox(height: Get.height * 0.03),

              /// TEXT FIELD
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: CustomTextField(
                      hintText: s.email,
                      keyboardType: TextInputType.emailAddress)),
              const SizedBox(height: 16.0), // Add spacing between fields
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child:
                      CustomTextField(hintText: s.password, obscureText: true)),
              const SizedBox(height: 16.0), // Add spacing between fields
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: CustomTextField(
                      hintText: s.confirmPassword, obscureText: true)),
              SizedBox(height: Get.height * 0.04),

              /// BUTTONS
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                  child: CustomButton(
                      title: s.signup,
                      onTap: () => navigatorKey.currentState!
                          .pushNamed(PageRoutes.landing))),
              SizedBox(height: Get.height * 0.01),
              Text(s.forgetPassword,
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: Get.height * 0.01),
              Text(s.or, style: Theme.of(context).textTheme.bodyLarge),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                  child:
                      CustomButton2(title: s.signInWithGoogle, onTap: () {})),
              const Spacer(flex: 4)
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import 'components/custom_button.dart';
import 'components/custom_button2.dart';
import 'components/custom_fields.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/icons/img.png', width: 150, height: 150),
              SizedBox(height: Get.height * 0.02),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('New Users? \nRegister Here',
                      style: Theme.of(context).textTheme.titleLarge)),
              SizedBox(height: Get.height * 0.03),

              /// TEXT FIELD
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: CustomTextField(
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress)),
              const SizedBox(height: 16.0), // Add spacing between fields
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child:
                      CustomTextField(hintText: 'Password', obscureText: true)),
              const SizedBox(height: 16.0), // Add spacing between fields
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: CustomTextField(
                      hintText: 'Confirm Password', obscureText: true)),
              SizedBox(height: Get.height * 0.04),

              /// BUTTONS
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                  child: CustomButton(
                      title: 'Signup ',
                      onTap: () => navigatorKey.currentState!
                          .pushNamed(PageRoutes.register))),
              SizedBox(height: Get.height * 0.01),
              Text('Forget Password?',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: Get.height * 0.01),
              Text('or', style: Theme.of(context).textTheme.bodyLarge),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                  child: const CustomButton2(
                      title: 'Sign in with google', onTap: null)),
              const Spacer(flex: 4)
            ]),
      ),
    );
  }
}

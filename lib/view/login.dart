import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/view/components/custom_button.dart';
import 'package:artbotic/view/components/custom_button2.dart';
import 'package:artbotic/view/components/custom_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              /// HEADER
              Image.asset('assets/icons/img.png', width: 150, height: 150),
              SizedBox(height: Get.height * 0.03),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Existing Users, \nLog in Here',
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
              SizedBox(height: Get.height * 0.04),

              /// BUTTONS
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                  child: CustomButton(
                      title: 'Login',
                      onTap: () => navigatorKey.currentState!
                          .pushNamed(PageRoutes.register))),
              SizedBox(height: Get.height * 0.01),
              Text('Forget Password?',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: Get.height * 0.01),
              Text('or', style: Theme.of(context).textTheme.bodyLarge),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                  child: const CustomButton2(title: 'Sign in with google',onTap: null,)),
              const Spacer(flex: 4)
            ]),
      ),
    );
  }
}

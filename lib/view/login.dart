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
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/img.png', width: 150, height: 150),
              Text('Existing Users, Log in Here',
                  style: Theme.of(context).textTheme.titleLarge),
              const CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0), // Add spacing between fields
              const CustomTextField(
                hintText: 'Password',
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.17),
                child: const CustomButton(title: 'Login'),
              ),
              Text('Forget Password?',
                  style: Theme.of(context).textTheme.bodyLarge),
              Text('or', style: Theme.of(context).textTheme.bodyLarge),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.19),
                  child: const CustomButton2(title: 'Sign in with google')),
            ]),
      ),
    );
  }
}

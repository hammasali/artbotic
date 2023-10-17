import 'dart:async';

import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigatorKey.currentState!.pushReplacementNamed(PageRoutes.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: screenHeight,
            width: double.infinity,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset('assets/gif/splash.gif', height: 250),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'ArtBotic\n',
                            style: Theme.of(context).textTheme.titleLarge),
                        TextSpan(
                            text: 'Where Art Meets Technology',
                            style: Theme.of(context).textTheme.displayMedium)
                      ])),
                  const Spacer(flex: 4),
                  const CircularProgressIndicator.adaptive(),
                  const Spacer()
                ])));
  }
}

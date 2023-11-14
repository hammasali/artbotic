import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/utils/app_const.dart';
import 'package:artbotic/utils/globals.dart';
import 'package:flutter/material.dart';

import '../config/app_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
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
                  Image.asset(AppConsts.splashGif, height: 250),
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

  _initializeApp() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AppConfig().init();
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(PageRoutes.landing, (route) => false);
    });
  }
}

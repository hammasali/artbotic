import 'package:artbotic/view/inpainting.dart';
import 'package:artbotic/view/landing.dart';
import 'package:artbotic/view/language.dart';
import 'package:artbotic/view/login.dart';
import 'package:artbotic/view/purchases.dart';
import 'package:artbotic/view/register.dart';
import 'package:artbotic/view/splash_screen.dart';
import 'package:artbotic/view/subscriptions.dart';
import 'package:flutter/material.dart';

import '../model/Image_generation_model.dart';
import '../view/detail_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PageRoutes {
  static const String splashScreen = '/';
  static const String landing = '/landing';
  static const String authLanding = '/authLanding';
  static const String signIn = '/signIn';
  static const String profile = '/profile';
  static const String register = '/register';
  static const String creationDetail = '/creationDetail';
  static const String language = '/language';
  static const String purchases = '/purchases';
  static const String subscriptions = '/subscriptions';
  static const String inPainting = '/inPainting';
}

class PageNavigator extends StatelessWidget {
  const PageNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: PageRoutes.splashScreen,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case PageRoutes.signIn:
              builder = (_) => const Login();
              break;
            case PageRoutes.register:
              builder = (_) => const Register();
              break;
            case PageRoutes.landing:
              builder = (_) => Landing();
              break;
            case PageRoutes.inPainting:
              builder = (_) => InPainting();
              break;
            case PageRoutes.creationDetail:
              builder = (_) => CreationDetailPage(
                  imageGenerationModel:
                      settings.arguments as ImageGenerationModel);
              break;
            case PageRoutes.language:
              builder = (_) => Language();
              break;
            case PageRoutes.purchases:
              builder = (_) => Purchases();
              break;
            case PageRoutes.subscriptions:
              builder = (_) => Subscription();
              break;
            default:
              builder = (_) => const SplashScreen();
              break;
          }

          debugPrint('Opening Route: ${settings.name}');
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}

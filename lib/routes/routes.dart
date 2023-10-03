import 'package:artbotic/view/login.dart';
import 'package:artbotic/view/register.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PageRoutes {
  static const String landing = '/landing';
  static const String authLanding = '/authLanding';
  static const String signIn = '/signIn';
  static const String profile = '/profile';
  static const String register = '/register';
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
        initialRoute:
            // AppConfig().isSignedIn
            //     ? PageRoutes.landing
            //     :
            PageRoutes.authLanding,
        onGenerateInitialRoutes: (route, initialRoute) {
          // FlutterNativeSplash.remove();
          if (initialRoute == PageRoutes.authLanding) {
            return [MaterialPageRoute(builder: (_) => const Login())];
          } else {
            return [MaterialPageRoute(builder: (_) => Container())];
          }
        },
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            case PageRoutes.signIn:
              builder = (_) => Login();
              break;
            case PageRoutes.register:
              builder = (_) => Register();
              break;
            case PageRoutes.landing:
              builder = (_) => Container();
              break;
            case PageRoutes.profile:
              builder = (_) => Container();
              break;

            default:
              builder = (_) => settings.name == PageRoutes.authLanding
                  ? Container()
                  : Container();
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

import 'package:artbotic/controllers/theme_controller.dart';
import 'package:artbotic/routes/routes.dart';
import 'package:artbotic/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'locale/language_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LanguageController>(
        init: LanguageController()..getCurrentLanguage(),
        builder: (controller) {
          return MyApp(controller.locale.value);
        });
  }
}

class MyApp extends StatefulWidget {
  final Locale locale;

  MyApp(this.locale, {Key? key}) : super(key: key) {
    Get.locale = locale;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final ThemeController controller = Get.put(ThemeController());

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    controller.updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
          title: 'Art Botic',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: controller.themeMode.value,
          localizationsDelegates: [
            S.delegate,
            // GlobalMaterialLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate
          ],
          locale: Get.locale,
          supportedLocales: S.delegate.supportedLocales,
          home: const PageNavigator());
    });
  }
}

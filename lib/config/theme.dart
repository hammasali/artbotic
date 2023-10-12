import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color purpleColor = Color(0xFFC100FF);
  static const Color blueColor = Color(0xFF00EEFF);
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xFF000000);
  static const Color pinkColor = Color(0xFFE38BFF);
  static const Color lightPinkColor = Color(0xFFF5D7FF);
  static const Color greyColor = Color(0xFFF5F4F9);

  static Color lightBackgroundColor = const Color(0xffffffff);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightTextColor = const Color(0xFF1D2226);
  static Color lightIconColor = const Color(0xFF1D2226);
  static Color lightDividerColor = Colors.blueGrey.shade500;
  static Color lightAccentColor = Colors.blueGrey.shade200;

  static Color darkBackgroundColor = const Color(0xFF000000);
  static Color darkPrimaryColor = const Color(0xFF1D2226);
  static Color darkTextColor = const Color(0xffffffff);
  static Color darkIconColor = const Color(0xffffffff);
  static Color darkDividerColor = Colors.white;
  static Color darkAccentColor = Colors.blueGrey.shade600;

  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      dividerColor: lightDividerColor,
      primaryColor: lightPrimaryColor,
      hintColor: lightAccentColor,
      scaffoldBackgroundColor: lightBackgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.light(
          primary: lightPrimaryColor,
          background: lightBackgroundColor,
          surface: lightBackgroundColor,
          brightness: Brightness.light),
      textTheme: textTheme,
      iconTheme: IconThemeData(color: lightIconColor),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: GoogleFonts.solway(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              height: 29.0,
              letterSpacing: 0.0,
              color: lightTextColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightPrimaryColor,
          selectedItemColor: purpleColor,
          unselectedItemColor: blackColor));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: darkBackgroundColor,
      brightness: Brightness.dark,
      dividerColor: darkDividerColor,
      primaryColor: darkPrimaryColor,
      hintColor: darkAccentColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.dark(
          primary: darkPrimaryColor,
          background: darkBackgroundColor,
          surface: darkPrimaryColor,
          brightness: Brightness.dark),
      textTheme: textTheme,
      iconTheme: IconThemeData(color: darkIconColor),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: GoogleFonts.solway(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              height: 29.0,
              letterSpacing: 0.0,
              color: darkTextColor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkPrimaryColor,
          selectedItemColor: purpleColor,
          unselectedIconTheme: const IconThemeData(color: whiteColor),
          unselectedItemColor: whiteColor));

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: themeMode == ThemeMode.light
            ? lightBackgroundColor
            : darkBackgroundColor,
        systemNavigationBarDividerColor: Colors.transparent));
  }

  static final TextTheme textTheme = TextTheme(
      titleLarge: GoogleFonts.manrope(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          height: 1.316,
          letterSpacing: 0.0),
      titleMedium: GoogleFonts.manrope(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          height: 1.375,
          letterSpacing: 0.0),
      displayLarge: GoogleFonts.manrope(
          fontSize: 22.0,
          fontWeight: FontWeight.w700,
          height: 1.375,
          letterSpacing: 0.0),
      displayMedium: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0),
      bodyLarge: GoogleFonts.manrope(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          height: 1.316,
          letterSpacing: 0.0),
      bodyMedium: GoogleFonts.manrope(
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          height: 22.0 / 16.0,
          letterSpacing: 0.0),
      bodySmall: GoogleFonts.solway(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          height: 14.0 / 12.0,
          letterSpacing: 0.0));
}

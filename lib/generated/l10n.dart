// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Existing Users, \nLog in Here`
  String get existingUsersLogInHere {
    return Intl.message(
      'Existing Users, \nLog in Here',
      name: 'existingUsersLogInHere',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `New Users? \nRegister Here`
  String get newUsersRegisterHere {
    return Intl.message(
      'New Users? \nRegister Here',
      name: 'newUsersRegisterHere',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signup {
    return Intl.message(
      'Signup',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `My Creation`
  String get myCreation {
    return Intl.message(
      'My Creation',
      name: 'myCreation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Inpainting`
  String get inpainting {
    return Intl.message(
      'Inpainting',
      name: 'inpainting',
      desc: '',
      args: [],
    );
  }

  /// `Add Image`
  String get addImage {
    return Intl.message(
      'Add Image',
      name: 'addImage',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get uploadImage {
    return Intl.message(
      'Upload Image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Enter Prompt?`
  String get enterPrompt {
    return Intl.message(
      'Enter Prompt?',
      name: 'enterPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Write a lot of description here`
  String get description {
    return Intl.message(
      'Write a lot of description here',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Prompt Builder`
  String get promptBuilder {
    return Intl.message(
      'Prompt Builder',
      name: 'promptBuilder',
      desc: '',
      args: [],
    );
  }

  /// `Select Styles`
  String get selectStyles {
    return Intl.message(
      'Select Styles',
      name: 'selectStyles',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Advance Settings`
  String get advanceSettings {
    return Intl.message(
      'Advance Settings',
      name: 'advanceSettings',
      desc: '',
      args: [],
    );
  }

  /// `Choose Settings`
  String get chooseSettings {
    return Intl.message(
      'Choose Settings',
      name: 'chooseSettings',
      desc: '',
      args: [],
    );
  }

  /// `Negative Prompt`
  String get negativePrompt {
    return Intl.message(
      'Negative Prompt',
      name: 'negativePrompt',
      desc: '',
      args: [],
    );
  }

  /// `Don't Include`
  String get dontInclude {
    return Intl.message(
      'Don\'t Include',
      name: 'dontInclude',
      desc: '',
      args: [],
    );
  }

  /// `Aspect Ratio`
  String get aspectRatio {
    return Intl.message(
      'Aspect Ratio',
      name: 'aspectRatio',
      desc: '',
      args: [],
    );
  }

  /// `CGF Scale`
  String get cgfScale {
    return Intl.message(
      'CGF Scale',
      name: 'cgfScale',
      desc: '',
      args: [],
    );
  }

  /// `Better Quality`
  String get betterQuality {
    return Intl.message(
      'Better Quality',
      name: 'betterQuality',
      desc: '',
      args: [],
    );
  }

  /// `Match Prompt`
  String get matchPrompt {
    return Intl.message(
      'Match Prompt',
      name: 'matchPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Seed`
  String get seed {
    return Intl.message(
      'Seed',
      name: 'seed',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get generate {
    return Intl.message(
      'Generate',
      name: 'generate',
      desc: '',
      args: [],
    );
  }

  /// `Inspiration`
  String get inspiration {
    return Intl.message(
      'Inspiration',
      name: 'inspiration',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get prompt {
    return Intl.message(
      'Prompt',
      name: 'prompt',
      desc: '',
      args: [],
    );
  }

  /// `Pro`
  String get pro {
    return Intl.message(
      'Pro',
      name: 'pro',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade To Pro`
  String get upgradeToPro {
    return Intl.message(
      'Upgrade To Pro',
      name: 'upgradeToPro',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message(
      'Rate Us',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Customer Support`
  String get customerSupport {
    return Intl.message(
      'Customer Support',
      name: 'customerSupport',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `More Apps`
  String get moreApps {
    return Intl.message(
      'More Apps',
      name: 'moreApps',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Variation`
  String get variation {
    return Intl.message(
      'Variation',
      name: 'variation',
      desc: '',
      args: [],
    );
  }

  /// `Evolve`
  String get evolve {
    return Intl.message(
      'Evolve',
      name: 'evolve',
      desc: '',
      args: [],
    );
  }

  /// `Upscale`
  String get upscale {
    return Intl.message(
      'Upscale',
      name: 'upscale',
      desc: '',
      args: [],
    );
  }

  /// `Retouch`
  String get retouch {
    return Intl.message(
      'Retouch',
      name: 'retouch',
      desc: '',
      args: [],
    );
  }

  /// `Bin`
  String get bin {
    return Intl.message(
      'Bin',
      name: 'bin',
      desc: '',
      args: [],
    );
  }

  /// `Send Us a Message`
  String get sendUsAMessage {
    return Intl.message(
      'Send Us a Message',
      name: 'sendUsAMessage',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Your email`
  String get yourEmail {
    return Intl.message(
      'Your email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Write your queries here...`
  String get writeYourQueriesHere {
    return Intl.message(
      'Write your queries here...',
      name: 'writeYourQueriesHere',
      desc: '',
      args: [],
    );
  }

  /// `Submit Form`
  String get submitForm {
    return Intl.message(
      'Submit Form',
      name: 'submitForm',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueTxt {
    return Intl.message(
      'Continue',
      name: 'continueTxt',
      desc: '',
      args: [],
    );
  }

  /// `Choose a plan`
  String get chooseAPlan {
    return Intl.message(
      'Choose a plan',
      name: 'chooseAPlan',
      desc: '',
      args: [],
    );
  }

  /// `Unlock all the advance feature by upgrading to premium plan`
  String get unlockAllTheAdvanceTxt {
    return Intl.message(
      'Unlock all the advance feature by upgrading to premium plan',
      name: 'unlockAllTheAdvanceTxt',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ur'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

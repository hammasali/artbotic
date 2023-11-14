import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final NotificationServices instance = NotificationServices._();

  NotificationServices._();

  final String darwinNotificationCategoryText = 'textCategory';
  final String darwinNotificationCategoryPlain = 'plainCategory';
  final String navigationActionId = 'id_3';

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidNotificationChannel _androidChannel =
      _createAndroidNotificationChannel();
  AndroidInitializationSettings? initializationSettingsAndroid;
  DarwinInitializationSettings? initializationSettingsIOS;
  NotificationDetails? _notificationDetails;

  Future<void> initializePlatformNotifications() async {
    if (Platform.isAndroid) {
      await _initializeAndroidNotifications();
    } else {
      await _initializeIOSNotifications();
    }
    await _initializeLocalNotifications();
  }

  Future<void> _initializeAndroidNotifications() async {
    initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        _androidChannel.id, _androidChannel.name,
        priority: Priority.high,
        channelDescription: 'your channel description',
        importance: Importance.high,
        styleInformation: const BigTextStyleInformation(''),
        autoCancel: true,
        ticker: 'ticker');

    _notificationDetails = NotificationDetails(android: androidDetails);
  }

  static AndroidNotificationChannel _createAndroidNotificationChannel() {
    return const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.max);
  }

  Future<void> _initializeIOSNotifications() async {
    List<DarwinNotificationCategory> categories = _createIOSCategories();
    initializationSettingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
        notificationCategories: categories);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  List<DarwinNotificationCategory> _createIOSCategories() {
    return <DarwinNotificationCategory>[
      DarwinNotificationCategory(darwinNotificationCategoryText,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.text('text_1', 'Action 1',
                buttonTitle: 'Send', placeholder: 'Placeholder')
          ]),
      DarwinNotificationCategory(darwinNotificationCategoryPlain,
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain('id_2', 'Action 2 (destructive)',
                options: <DarwinNotificationActionOption>{
                  DarwinNotificationActionOption.destructive
                }),
            DarwinNotificationAction.plain(
                navigationActionId, 'Action 3 (foreground)',
                options: <DarwinNotificationActionOption>{
                  DarwinNotificationActionOption.foreground
                }),
            DarwinNotificationAction.plain('id_4', 'Action 4 (auth required)',
                options: <DarwinNotificationActionOption>{
                  DarwinNotificationActionOption.authenticationRequired
                })
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle
          })
    ];
  }

  Future<void> _initializeLocalNotifications() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
  }

  onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  showForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _flutterLocalNotificationsPlugin.show(
          0, // Use a constant ID to overwrite the previous notification
          'The image has been generated successfully',
          'Success',
          _notificationDetails);
    });
  }
}

//Function to handle notification tap in background
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
}
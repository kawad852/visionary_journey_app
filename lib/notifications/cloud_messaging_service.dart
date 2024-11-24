import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../notifications/local_notifications_service.dart';
import '../notifications/notifications_route.dart';
import '../utils/shared_pref.dart';

class CloudMessagingService {
  Future<void> requestPermission() async {
    return await FirebaseMessaging.instance.requestPermission().then((value) {
      FirebaseMessaging.instance.subscribeToTopic('all_${MySharedPreferences.language}');
    });
  }

  Future<void> init(BuildContext context) async {
    await LocalNotificationsService().initialize();

    FirebaseMessaging.onMessage.listen(
      (event) {
        // ignore: use_build_context_synchronously
        _handleLocalMessage(context, event);
      },
    );

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleBackgroundMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
  }

  void _handleLocalMessage(BuildContext context, RemoteMessage? message) {
    final data = message?.notification;
    log("ReceivedNotification::\nType:: ForegroundMessage\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message?.data}");
    LocalNotificationsService().display(context, message!);
  }

  void _handleBackgroundMessage(RemoteMessage message) {
    final data = message.notification;
    debugPrint("ReceivedNotification::\nType:: Background\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message.data}");
    NotificationsRouteHandler.toggle(
      rootNavigatorKey.currentContext!,
      id: message.data['id'],
      type: message.data['type'],
    );
  }
}

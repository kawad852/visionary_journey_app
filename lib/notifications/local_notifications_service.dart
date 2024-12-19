import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // static late AndroidNotificationChannel androidChannel;

  final channel1 = const AndroidNotificationChannel(
    'channel_id_1', // id
    'channel_id_1', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_en_1'),
  );

  final channel2 = const AndroidNotificationChannel(
    'channel_id_2', // id
    'channel_id_2', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_en_1'),
  );

  final channel3 = const AndroidNotificationChannel(
    'channel_id_3', // id
    'channel_id_3', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_ar_1'),
  );

  final channel4 = const AndroidNotificationChannel(
    'channel_id_4', // id
    'channel_id_4', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_ar_1'),
  );

  final channel5 = const AndroidNotificationChannel(
    'channel_id_5', // id
    'channel_id_5', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_en_2'),
  );

  final channel6 = const AndroidNotificationChannel(
    'channel_id_6', // id
    'channel_id_6', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_en_2'),
  );

  final channel7 = const AndroidNotificationChannel(
    'channel_id_7', // id
    'channel_id_7', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_ar_2'),
  );

  final channel8 = const AndroidNotificationChannel(
    'channel_id_8', // id
    'channel_id_8', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_ar_2'),
  );

  final channel9 = const AndroidNotificationChannel(
    'channel_id_9', // id
    'channel_id_9', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_en_3'),
  );

  final channel10 = const AndroidNotificationChannel(
    'channel_id_10', // id
    'channel_id_10', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_en_3'),
  );

  final channel11 = const AndroidNotificationChannel(
    'channel_id_11', // id
    'channel_id_11', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_ar_3'),
  );

  final channel12 = const AndroidNotificationChannel(
    'channel_id_12', // id
    'channel_id_12', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_ar_3'),
  );

  final channel13 = const AndroidNotificationChannel(
    'channel_id_13', // id
    'channel_id_13', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_en_4'),
  );

  final channel14 = const AndroidNotificationChannel(
    'channel_id_14', // id
    'channel_id_14', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_en_4'),
  );

  final channel15 = const AndroidNotificationChannel(
    'channel_id_15', // id
    'channel_id_15', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('male_ar_4'),
  );

  final channel16 = const AndroidNotificationChannel(
    'channel_id_16', // id
    'channel_id_16', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('female_ar_4'),
  );

  Future<void> initialize() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
          // requestSoundPermission: false,
          // requestBadgePermission: false,
          // requestAlertPermission: false,
          ),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (message) {
        if (message.payload != null && message.payload!.isNotEmpty) {
          Map<String, dynamic> data = json.decode(message.payload!);
          // NotificationsRouteService().toggle(navigatorKey.currentContext!, data);
        }
      },
    );
  }

  void createChannels() {
    final plugin = _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    plugin?.createNotificationChannel(channel1);
    plugin?.createNotificationChannel(channel2);
    plugin?.createNotificationChannel(channel3);
    plugin?.createNotificationChannel(channel4);
    plugin?.createNotificationChannel(channel5);
    plugin?.createNotificationChannel(channel6);
    plugin?.createNotificationChannel(channel7);
    plugin?.createNotificationChannel(channel8);
    plugin?.createNotificationChannel(channel9);
    plugin?.createNotificationChannel(channel10);
    plugin?.createNotificationChannel(channel11);
    plugin?.createNotificationChannel(channel12);
    plugin?.createNotificationChannel(channel13);
    plugin?.createNotificationChannel(channel14);
    plugin?.createNotificationChannel(channel15);
    plugin?.createNotificationChannel(channel16);
  }

  String _getSoundByChannelId(String channelId) {
    switch (channelId) {
      case 'channel_id_1':
        return 'male_en_1';
      case 'channel_id_2':
        return 'female_en_1';
      case 'channel_id_3':
        return 'male_ar_1';
      case 'channel_id_4':
        return 'female_ar_1';
      case 'channel_id_5':
        return 'male_en_2';
      case 'channel_id_6':
        return 'female_en_2';
      case 'channel_id_7':
        return 'male_ar_2';
      case 'channel_id_8':
        return 'female_ar_2';
      case 'channel_id_9':
        return 'male_en_3';
      case 'channel_id_10':
        return 'female_en_3';
      case 'channel_id_11':
        return 'male_ar_3';
      case 'channel_id_12':
        return 'female_ar_3';
      case 'channel_id_13':
        return 'male_en_4';
      case 'channel_id_14':
        return 'female_en_4';
      case 'channel_id_15':
        return 'male_ar_4';
      case 'channel_id_16':
        return 'female_ar_4';
      case 'channel_id_17':
        return 'male_en_5';
      case 'channel_id_18':
        return 'female_en_5';
      case 'channel_id_19':
        return 'male_ar_5';
      case 'channel_id_20':
        return 'female_ar_5';
      default:
        return 'default_sound';
    }
  }

  //for notifications in foreground
  void display(BuildContext context, RemoteMessage message) async {
    try {
      final data = message.notification;
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final pLoad = json.encode(message.data);
      Map<String, dynamic> nData = json.decode(pLoad);
      final channelId = nData['channel_id'] ?? '';
      final sound = _getSoundByChannelId(channelId);
      debugPrint("channelId::: $channelId\nsound:: $sound");
      final androidChannel1 = AndroidNotificationChannel(
        channelId, // id
        channelId, // title
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound(sound),
      );
      await _flutterLocalNotificationsPlugin.show(
        id,
        data?.title,
        data?.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidChannel1.id,
            androidChannel1.name,
            channelDescription: androidChannel1.description,
            importance: androidChannel1.importance,
            playSound: androidChannel1.playSound,
            icon: '@mipmap/ic_launcher',
            color: context.colorScheme.primary,
            sound: androidChannel1.sound,
          ),
          iOS: DarwinNotificationDetails(
            sound: '$sound.wav',
          ),
        ),
        payload: json.encode(message.data),
      );
    } on Exception catch (e) {
      log("Exception:: $e");
    }
  }
}

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

enum SocialPlatformEnum { facebook, instagram, twitter }

class AppContactService {
  static const String mobileNum1 = '+962780190006';
  static const String mobileNum2 = '+962780190006';
  static const String whatsAppNum = '+962780190006';
  static const String email = 'info@varvox.com';
  static const String _facebookPageId = '100057517656484';
  static const String _facebookUsername = 'varvoxlogistics';
  static const String _instagramUsername = 'varvox_express';
  static const String _twitterUsername = 'varvox';
  static const String _linkedInUserName = 'varvox';

  ///url
  //facebook
  static String get facebookNativeUrl => Platform.isAndroid ? "fb://page/$_facebookPageId" : "fb://profile/$_facebookPageId";
  static const String facebookWebUrl = "https://web.facebook.com/$_facebookUsername";
  //instagram
  static const String instagramNativeUrl = "instagram://user?username=$_instagramUsername";
  static const String instagramWebUrl = "https://www.instagram.com/$_instagramUsername/";
  //twitter
  static const String twitterNativeUrl = "twitter:///user?screen_name=$_twitterUsername";
  static const String twitterWebUrl = "https://twitter.com/$_twitterUsername";
  //linkedin
  static const String linkedInWebUrl = "https://www.linkedin.com/in/$_linkedInUserName";
  //phone, whatsApp and email
  static String get whatsAppUrl => Platform.isAndroid ? "https://wa.me/$whatsAppNum/" : "https://api.whatsapp.com/send?phone=$whatsAppNum";
  static const String mobileNum1Url = 'tel://$mobileNum1';
  static const String mobileNum2Url = 'tel://$mobileNum2';
  static const String emailUrl = 'mailto:$email';

  static String getPhoneNum() {
    final random = Random();
    List<int> randomNumbers = List.generate(9, (_) => random.nextInt(9));
    return 'tel://+962${randomNumbers.join()}';
  }

  /// mobileNum, whatsapp and email
  static Future<void> lunch(BuildContext context, String path) async {
    try {
      final uri = Uri.parse(path);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint("UrlLauncherError:: $e");
      if (context.mounted) {
        Fluttertoast.showToast(msg: context.appLocalization.generalError);
      }
    }
  }

  ///maps
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open the map.';
    }
  }
}

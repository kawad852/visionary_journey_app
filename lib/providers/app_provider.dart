import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../models/country_code/country_code_model.dart';
import '../utils/app_constants.dart';
import '../utils/my_images.dart';
import '../utils/shared_pref.dart';

class AppProvider extends ChangeNotifier {
  Locale appLocale = Locale(MySharedPreferences.language);
  String appTheme = MySharedPreferences.theme;
  static String countryCode = MySharedPreferences.countryCode;
  late Future<List<Uint8List>> markerFuture;
  late StatefulNavigationShell navigationShell;

  void goToDiscoverBranch() {
    navigationShell.goBranch(0);
  }

  void setLanguage(
    BuildContext context, {
    required String languageCode,
  }) async {
    MySharedPreferences.language = languageCode;
    appLocale = Locale(languageCode);
    notifyListeners();
  }

  void setTheme(
    BuildContext context, {
    required String theme,
  }) async {
    MySharedPreferences.theme = theme;
    appTheme = theme;
    notifyListeners();
  }

  static Future<void> getCountryCode() async {
    try {
      final response = await http.get(Uri.https('api.country.is'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final countryCodeModel = CountryCodeModel.fromJson(body);
        countryCode = countryCodeModel.countryCode ?? kFallBackCountryCode;
        MySharedPreferences.countryCode = countryCode;
      } else {
        countryCode = kFallBackCountryCode;
      }
    } catch (e) {
      countryCode = kFallBackCountryCode;
    } finally {
      debugPrint('countryCode:: $countryCode');
    }
  }

  Future<Uint8List> getBytesFromAsset(
    String path, {
    int width = 150,
  }) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  void initializeMarker() {
    markerFuture = Future.wait([getBytesFromAsset(MyImages.car), getBytesFromAsset(MyImages.circle, width: 40)]);
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user/user_model.dart';
import '../utils/app_constants.dart';
import '../utils/enums.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void clearStorage() {
    user = null;
  }

  static UserModel? get user {
    String? value = _sharedPreferences.getString('user');
    UserModel? userModel;
    if (value != null && value.isNotEmpty && value != 'null') {
      userModel = UserModel.fromJson(jsonDecode(value));
    }
    return userModel;
  }

  static set user(UserModel? value) {
    value?.createdAt = null;
    _sharedPreferences.setString('user', jsonEncode(value?.toJson()));
  }

  static Map<String, dynamic> get queryParams {
    String value = _sharedPreferences.getString('extra') ?? '';
    Map<String, dynamic> queryParams = {};
    if (value.isNotEmpty) {
      queryParams = jsonDecode(value);
    }
    return queryParams;
  }

  static set queryParams(Map<String, dynamic> value) {
    _sharedPreferences.setString('extra', jsonEncode(value));
  }

  static String get language => _sharedPreferences.getString('language') ?? LanguageEnum.english;
  static set language(String value) => _sharedPreferences.setString('language', value);

  static String get theme => _sharedPreferences.getString('theme') ?? ThemeEnum.light;
  static set theme(String value) => _sharedPreferences.setString('theme', value);

  static bool get isPassedIntro => _sharedPreferences.getBool('isPassedIntro') ?? false;
  static set isPassedIntro(bool value) => _sharedPreferences.setBool('isPassedIntro', value);

  static String get countryCode => _sharedPreferences.getString('countryCode') ?? kFallBackCountryCode;
  static set countryCode(String value) => _sharedPreferences.setString('countryCode', value);

  static String get appDirction => _sharedPreferences.getString('appDirction') ?? AppDirction.normal;
  static set appDirction(String value) => _sharedPreferences.setString('appDirction', value);

  static List<String> get suggestions {
    var value = _sharedPreferences.getString('suggestions');
    List<String> suggestions = [];
    if (value != null && value.isNotEmpty && value != 'null') {
      List<dynamic> result = jsonDecode(value);
      suggestions = result.toList().map((element) => '$element').toList();
      return suggestions;
    } else {
      return [];
    }
  }

  static set suggestions(List<String> value) {
    _sharedPreferences.setString('suggestions', jsonEncode(value));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../alerts/loading/app_loading_indicators.dart';
import '../providers/app_provider.dart';
import '../providers/location_provider.dart';
import '../providers/order_provider.dart';
import '../providers/user_provider.dart';
import '../utils/enums.dart';

extension LanguageExtension on BuildContext {
  AppLocalizations get appLocalization => AppLocalizations.of(this)!;

  String get languageCode => Localizations.localeOf(this).languageCode;

  bool get isLTR => Localizations.localeOf(this).languageCode == LanguageEnum.english;

  String translate({
    required String textEN,
    required String textAR,
  }) {
    return isLTR ? textEN : textAR;
  }
}

extension AppLoadingIncidatorExtension on BuildContext {
  AppLoadingIndicator get loaders => AppLoadingIndicator.of(this);
}

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ProvidersExtension on BuildContext {
  UserProvider get userProvider => read<UserProvider>();
  AppProvider get appProvider => read<AppProvider>();
  LocationProvider get locationProvider => read<LocationProvider>();
  OrderProvider get orderProvider => read<OrderProvider>();
}

extension CommonExtensions on BuildContext {
  void unFocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
  double get systemButtonHeight => Theme.of(this).buttonTheme.height;
  String get currentRoutePath => GoRouter.of(this).routeInformationProvider.value.uri.path;
  String get currency => isLTR ? 'JD' : 'د.أ';
  String? get countryCode => AppProvider.countryCode;

  void navigate(
    Widget Function(BuildContext context) builder, {
    bool fullscreenDialog = false,
  }) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: builder, fullscreenDialog: fullscreenDialog),
    );
  }
}

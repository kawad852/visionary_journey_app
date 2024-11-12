import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/screens/card/card_screen.dart';
import 'package:visionary_journey_app/screens/home/home_screen.dart';

import 'firebase_options.dart';
import 'models/user/user_model.dart';
import 'providers/app_provider.dart';
import 'providers/location_provider.dart';
import 'providers/user_provider.dart';
import 'screens/login/login_screen.dart';
import 'utils/base_extensions.dart';
import 'utils/enums.dart';
import 'utils/my_theme.dart';
import 'utils/shared_pref.dart';

// web-design BRANCH

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  final data = message.notification;
  debugPrint("ReceivedNotification::\nType::onBackgroundMessage\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData::${message.data}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(AppProvider.getCountryCode());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await MySharedPreferences.init();
  // await FirebaseAuth.instance.signOut();
  // MySharedPreferences.clearStorage();
  // MySharedPreferences.isPassedIntro = false;
  // await FlutterBranchSdk.init(enableLogging: false, disableTracking: false);
  // FlutterBranchSdk.validateSDKIntegration();
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = context.userProvider;
    context.appProvider.initializeMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppProvider, UserProvider>(
      builder: (context, appProvider, userProvider, child) {
        final seedColorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF70E2E2),
          brightness: appProvider.appTheme == ThemeEnum.light ? Brightness.light : Brightness.dark,
        );
        return MultiProvider(
          providers: [
            StreamProvider<UserModel?>.value(
              key: ValueKey(userProvider.isAuthenticated),
              value: userProvider.isAuthenticated ? _userProvider.userStream.map((event) => event.data()) : null,
              initialData: MySharedPreferences.user,
              lazy: false,
              updateShouldNotify: (initialValue, value) {
                MySharedPreferences.user = value;
                Future.microtask(() {
                  if (value == null || value.blocked) {
                    // Fluttertoast.showToast(msg: "Authorization Failed");
                    // ignore: use_build_context_synchronously
                    _userProvider.logout(context);
                  }
                });
                return true;
              },
            ),
          ],
          child: MaterialApp(
            navigatorKey: rootNavigatorKey,
            builder: (context, child) {
              // do your initialization here
              child = EasyLoading.init()(context, child);
              child = ResponsiveBreakpoints.builder(
                child: child,
                breakpoints: [
                  const Breakpoint(start: 0, end: 650, name: MOBILE),
                  const Breakpoint(start: 651, end: 1000, name: TABLET),
                  const Breakpoint(start: 1001, end: 2000, name: DESKTOP),
                  const Breakpoint(start: 2001, end: double.infinity, name: '4K'),
                ],
              );
              return child;
            },
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: appProvider.appLocale,
            theme: MyTheme().materialTheme(context, seedColorScheme),
            home: const CardScreen(),
          ),
        );
      },
    );
  }
}

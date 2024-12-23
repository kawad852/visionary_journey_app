import 'package:flutter/material.dart';
import 'package:visionary_journey_app/notifications/cloud_messaging_service.dart';
import 'package:visionary_journey_app/screens/login/login_screen.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class AllowLocationScreen extends StatefulWidget {
  const AllowLocationScreen({super.key});

  @override
  State<AllowLocationScreen> createState() => _AllowLocationScreenState();
}

class _AllowLocationScreenState extends State<AllowLocationScreen> {
  final cloudMessaging = CloudMessagingService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBDBDBD),
              Color(0xFFFBFBFB),
            ],
            begin: Alignment(0, 0),
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 10),
                  child: Image.asset(
                    MyImages.logoText,
                    color: context.colorPalette.black1D,
                  ),
                ),
              ),
              if (MySharedPreferences.appDirction == AppDirction.normal) const Spacer(),
              Align(
                alignment: MySharedPreferences.appDirction == AppDirction.right
                    ? Alignment.centerRight
                    : MySharedPreferences.appDirction == AppDirction.left
                        ? Alignment.centerLeft
                        : AlignmentDirectional.center,
                child: Padding(
                  padding: EdgeInsets.only(top: MySharedPreferences.appDirction == AppDirction.normal ? 0 : 50),
                  child: SizedBox(
                    width: MySharedPreferences.appDirction == AppDirction.normal ? double.infinity : context.mediaQuery.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.appLocalization.enableLocation1,
                          style: TextStyle(
                            color: context.colorPalette.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            context.appLocalization.enableLocation2,
                            style: TextStyle(
                              color: context.colorPalette.black1D,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            context.appLocalization.enableVibrationFeature,
                            style: TextStyle(
                              color: context.colorPalette.black1D,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        StretchedButton(
                          onPressed: () {
                            cloudMessaging.init(context);
                            cloudMessaging.requestPermission().then((value) {
                              context.locationProvider.determinePosition(
                                context,
                                withOverLayLoader: true,
                                showSnackBar: true,
                                onPermissionGranted: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                              );
                            });
                          },
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            context.appLocalization.enableLocation3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.colorPalette.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

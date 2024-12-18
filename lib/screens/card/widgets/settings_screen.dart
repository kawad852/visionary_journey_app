import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/settings_card.dart';
import 'package:visionary_journey_app/screens/card/widgets/settings_text.dart';
import 'package:visionary_journey_app/screens/intro/intro_screen.dart';
import 'package:visionary_journey_app/screens/langauge_screen.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

import '../../../network/my_fields.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double textSize = 0.2;
  bool _visual = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: kDebugMode
          ? FloatingActionButton(
              onPressed: () {
                context.userProvider.userDocRef.update({
                  MyFields.orderId: null,
                });
              },
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Align(
            alignment: MySharedPreferences.appDirction == AppDirction.right
                ? AlignmentDirectional.centerEnd
                : MySharedPreferences.appDirction == AppDirction.left
                    ? AlignmentDirectional.centerStart
                    : AlignmentDirectional.center,
            child: SizedBox(
              width: MySharedPreferences.appDirction == AppDirction.normal ? double.infinity : context.mediaQuery.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MySharedPreferences.appDirction == AppDirction.normal ? MainAxisAlignment.end : MainAxisAlignment.center,
                children: [
                  Text(
                    context.appLocalization.appSettings,
                    style: TextStyle(
                      color: context.colorPalette.black1D,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 9),
                  SettingsCard(
                    onTap: () {
                      setState(() {
                        _visual = !_visual;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: SettingsText(
                            context.appLocalization.visualText,
                          ),
                        ),
                        Switch(
                          value: _visual,
                          activeTrackColor: context.colorPalette.black1D,
                          onChanged: (value) {
                            setState(() {
                              _visual = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SettingsCard(
                    onTap: () {
                      setState(() {
                        MySharedPreferences.soundNotifications = !MySharedPreferences.soundNotifications;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: SettingsText(context.appLocalization.activatedSound),
                        ),
                        Switch(
                          value: MySharedPreferences.soundNotifications,
                          activeTrackColor: context.colorPalette.black1D,
                          onChanged: (value) {
                            setState(() {
                              MySharedPreferences.soundNotifications = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SettingsCard(
                          onTap: () {},
                          child: SettingsText(context.appLocalization.voiceOption),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            MySharedPreferences.isVoiceMale = true;
                          });
                          context.userProvider.userDocRef.update({
                            MyFields.gender: "MALE",
                          });
                        },
                        child: Container(
                          width: 90,
                          height: 48,
                          margin: const EdgeInsets.only(bottom: 12, left: 5, right: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MySharedPreferences.isVoiceMale ? context.colorPalette.black1D : context.colorPalette.white,
                            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                          ),
                          child: Text(
                            context.appLocalization.male,
                            style: TextStyle(
                              color: MySharedPreferences.isVoiceMale ? context.colorPalette.white : context.colorPalette.black1D,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            MySharedPreferences.isVoiceMale = false;
                          });
                          context.userProvider.userDocRef.update({
                            MyFields.gender: "FEMALE",
                          });
                        },
                        child: Container(
                          width: 90,
                          height: 48,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: !MySharedPreferences.isVoiceMale ? context.colorPalette.black1D : context.colorPalette.white,
                            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                          ),
                          child: Text(
                            context.appLocalization.female,
                            style: TextStyle(
                              color: !MySharedPreferences.isVoiceMale ? context.colorPalette.white : context.colorPalette.black1D,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SettingsCard(
                    onTap: () {
                      setState(() {
                        MySharedPreferences.locationAccess = !MySharedPreferences.locationAccess;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: SettingsText(context.appLocalization.locationAccess),
                        ),
                        Switch(
                          value: MySharedPreferences.locationAccess,
                          activeTrackColor: context.colorPalette.black1D,
                          onChanged: (value) {
                            setState(() {
                              MySharedPreferences.locationAccess = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // SettingsCard(
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         "Aa",
                  //         style: TextStyle(
                  //           color: context.colorPalette.black1D,
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Slider(
                  //           value: textSize,
                  //           activeColor: context.colorPalette.black1D,
                  //           inactiveColor: context.colorPalette.grey66,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               textSize = value;
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //       Text(
                  //         "Aa",
                  //         style: TextStyle(
                  //           color: context.colorPalette.black1D,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SettingsCard(
                    onTap: () {
                      context.navigate((context) {
                        return const IntroScreen(isEdit: true);
                      }).then((value) {
                        setState(() {});
                      });
                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SettingsText(context.appLocalization.adjustViewAngel),
                    ),
                  ),
                  SettingsCard(
                    onTap: () {
                      context.navigate((context) {
                        return const LanguageScreen();
                      });
                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SettingsText(context.appLocalization.language),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

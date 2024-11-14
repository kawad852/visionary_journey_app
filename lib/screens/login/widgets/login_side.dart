import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/editors/password_editor.dart';
import 'package:visionary_journey_app/widgets/phone_field.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class LoginSide extends StatelessWidget {
  final PhoneController controller;
  const LoginSide({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: Image.asset(MyImages.visionaryJourney),
          ),
        ),
        Align(
          alignment: MySharedPreferences.appDirction == AppDirction.left 
          ? AlignmentDirectional.centerStart
          : AlignmentDirectional.centerEnd,
          child: Container(
            width: context.mediaQuery.width * 0.5,
            margin: const EdgeInsetsDirectional.only(top: 50, start: 20, end: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log in",
                  style: TextStyle(
                    color: context.colorPalette.black1D,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PhoneField(
                    controller: controller,
                  ),
                ),
                PasswordEditor(
                  initialValue: null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: StretchedButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: context.colorPalette.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.colorPalette.black1D,
                          borderRadius:
                              BorderRadius.circular(MyTheme.radiusTertiary),
                        ),
                        child: const CustomSvg(MyIcons.fingerprint),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

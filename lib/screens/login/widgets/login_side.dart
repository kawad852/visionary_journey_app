import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/phone_field.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class LoginSide extends StatelessWidget {
  final PhoneController controller;
  final VoidCallback onSubmit;

  const LoginSide({
    super.key,
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: Image.asset(
              MyImages.visionaryJourney,
              color: context.colorPalette.black1D,
            ),
          ),
        ),
        Align(
          alignment: MySharedPreferences.appDirction == AppDirction.left ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
          child: Container(
            width: context.mediaQuery.width * 0.5,
            margin: const EdgeInsetsDirectional.only(top: 50, start: 20, end: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.appLocalization.login,
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
                Row(
                  children: [
                    Expanded(
                      child: StretchedButton(
                        onPressed: onSubmit,
                        child: Text(
                          context.appLocalization.login,
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
                          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
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

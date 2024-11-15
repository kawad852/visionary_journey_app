import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/editors/password_editor.dart';
import 'package:visionary_journey_app/widgets/phone_field.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class LoginNormal extends StatelessWidget {
  final PhoneController controller;
  const LoginNormal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(MyImages.visionaryJourney),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: PhoneField(
                          controller: controller,
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
                ),
                PasswordEditor(
                  initialValue: null,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                StretchedButton(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

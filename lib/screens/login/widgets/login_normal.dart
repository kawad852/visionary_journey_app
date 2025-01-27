import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/screens/login/widgets/otp_editor.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/widgets/phone_field.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class LoginNormal extends StatelessWidget {
  final PhoneController? controller;
  final VoidCallback onSubmit;
  final Function(String? value)? onChanged;

  const LoginNormal({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isVerify = controller == null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset(
                MyImages.visionaryJourney,
                color: context.colorPalette.black1D,
              ),
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
                  isVerify ? context.appLocalization.enterOtp : context.appLocalization.login,
                  style: TextStyle(
                    color: context.colorPalette.black1D,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isVerify)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: OtpEditor(
                      onChanged: onChanged!,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: PhoneField(
                            controller: controller!,
                          ),
                        ),
                        // if (MySharedPreferences.fingerPrintId.isNotEmpty) ...[
                        //   const SizedBox(width: 10),
                        //   GestureDetector(
                        //     onTap: () {
                        //       context.userProvider.getFingerPrint(context);
                        //     },
                        //     child: Container(
                        //       width: 50,
                        //       height: 50,
                        //       alignment: Alignment.center,
                        //       decoration: BoxDecoration(
                        //         color: context.colorPalette.black1D,
                        //         borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                        //       ),
                        //       child: const CustomSvg(MyIcons.fingerprint),
                        //     ),
                        //   ),
                        // ],
                      ],
                    ),
                  ),
                StretchedButton(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

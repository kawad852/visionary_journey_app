import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class OrderLoading extends StatelessWidget {
  final VoidCallback onCancel;
  final String pickLabelText, arrivalLabelText;

  const OrderLoading({
    super.key,
    required this.onCancel,
    required this.pickLabelText,
    required this.arrivalLabelText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: MySharedPreferences.appDirction == AppDirction.right
          ? AlignmentDirectional.centerEnd
          : MySharedPreferences.appDirction == AppDirction.left
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.center,
      child: SizedBox(
        width: MySharedPreferences.appDirction == AppDirction.normal ? double.infinity : context.mediaQuery.width * 0.65,
        child: Column(
          mainAxisAlignment: MySharedPreferences.appDirction == AppDirction.normal ? MainAxisAlignment.end : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelpBubble(),
            Container(
              width: double.infinity,
              height: 210,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              margin: MySharedPreferences.appDirction != AppDirction.normal ? const EdgeInsets.symmetric(horizontal: 10) : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: context.colorPalette.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                  bottomLeft: MySharedPreferences.appDirction != AppDirction.normal ? const Radius.circular(30) : const Radius.circular(0),
                  bottomRight: MySharedPreferences.appDirction != AppDirction.normal ? const Radius.circular(30) : const Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  LocationInfo(
                    isVolume: false,
                    pickLabelText: pickLabelText,
                    arrivalLabelText: arrivalLabelText,
                  ),
                  LoadingAnimationWidget.progressiveDots(
                    color: Colors.blue,
                    size: 70,
                  ),
                  StretchedButton(
                    onPressed: onCancel,
                    backgroundColor: context.colorPalette.grey66,
                    child: Text(
                      context.appLocalization.cancel,
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
          ],
        ),
      ),
    );
  }
}

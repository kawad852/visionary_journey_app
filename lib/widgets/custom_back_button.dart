import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

import '../utils/enums.dart';
import '../utils/shared_pref.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final myDirection = MySharedPreferences.appDirction;
    final flip =
        myDirection == AppDirction.right && context.languageCode == LanguageEnum.english || myDirection == AppDirction.left && context.languageCode == LanguageEnum.arabic;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: myDirection == AppDirction.normal
          ? null
          : myDirection == AppDirction.right
              ? TextDirection.rtl
              : TextDirection.ltr,
      children: [
        Transform.flip(
          flipX: flip,
          child: BackButton(),
        ),
        SizedBox.shrink(),
      ],
    );
  }
}

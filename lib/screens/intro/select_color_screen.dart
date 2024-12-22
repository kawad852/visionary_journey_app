import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/intro/widgets/forward_bubble.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

import '../../utils/enums.dart';
import '../../utils/my_images.dart';

class SelectColorScreen extends StatefulWidget {
  const SelectColorScreen({super.key});

  @override
  State<SelectColorScreen> createState() => _SelectColorScreenState();
}

class _SelectColorScreenState extends State<SelectColorScreen> {
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
              Text(
                context.appLocalization.appName,
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.appLocalization.projectBody,
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              if (MySharedPreferences.appDirction != AppDirction.normal)
                Align(
                  alignment: MySharedPreferences.appDirction == AppDirction.right ? Alignment.centerRight : Alignment.centerLeft,
                  child: SizedBox(
                    width: context.mediaQuery.width * 0.75,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 70,
                              height: 360,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF353535),
                                    context.colorPalette.black1D,
                                  ],
                                  begin: AlignmentDirectional.centerStart,
                                  end: AlignmentDirectional.centerEnd,
                                ),
                              ),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Slider(
                                  value: context.colorPalette.degree,
                                  min: 0.60,
                                  max: 1,
                                  activeColor: context.colorPalette.white,
                                  onChanged: (value) {
                                    setState(() {
                                      context.colorPalette.toggleDegree(value);
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ForwardBubble(key: UniqueKey())
                          ],
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                context.appLocalization.chooseColorText,
                                style: TextStyle(
                                  color: context.colorPalette.black1D,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 280,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              if (MySharedPreferences.appDirction == AppDirction.normal) ...[
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.appLocalization.chooseColorText,
                      style: TextStyle(
                        color: context.colorPalette.black1D,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF353535),
                                  context.colorPalette.black1D,
                                ],
                                begin: AlignmentDirectional.centerStart,
                                end: AlignmentDirectional.centerEnd,
                              ),
                            ),
                            child: Slider(
                              value: context.colorPalette.degree,
                              min: 0.60,
                              max: 1,
                              activeColor: context.colorPalette.white,
                              onChanged: (value) {
                                setState(() {
                                  context.colorPalette.toggleDegree(value);
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ForwardBubble(key: UniqueKey())
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

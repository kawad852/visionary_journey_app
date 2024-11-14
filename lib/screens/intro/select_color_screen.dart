import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/intro/widgets/forward_bubble.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

class SelectColorScreen extends StatefulWidget {
  const SelectColorScreen({super.key});

  @override
  State<SelectColorScreen> createState() => _SelectColorScreenState();
}

class _SelectColorScreenState extends State<SelectColorScreen> {
  double colorDegree = 0.2;
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
                  child: Image.asset(MyImages.logoText),
                ),
              ),
              Text(
                "Visionary Journey",
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Our project was designed to accommodate individuals with visual impairments and to empower them within the community.We will start by customizing the app settings to suit your needs.",
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              if (MySharedPreferences.appDirction != AppDirction.normal)
                Row(
                  mainAxisAlignment: MySharedPreferences.appDirction == AppDirction.right
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 360,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF353535),
                                Color(0xFF000000),
                              ],
                              begin: AlignmentDirectional.centerStart,
                              end: AlignmentDirectional.centerEnd,
                            ),
                          ),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Slider(
                              value: colorDegree,
                              activeColor: context.colorPalette.white,
                              onChanged: (value) {
                                setState(() {
                                  colorDegree = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const ForwardBubble()
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "Choose the color\ncontrast level until\nyou reach the best\noption for you.",
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
                    )
                  ],
                ),
              if (MySharedPreferences.appDirction == AppDirction.normal) ...[
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose the color contrast level until you reach the best option for you.",
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
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF353535),
                                  Color(0xFF000000),
                                ],
                                begin: AlignmentDirectional.centerStart,
                                end: AlignmentDirectional.centerEnd,
                              ),
                            ),
                            child: Slider(
                              value: colorDegree,
                              activeColor: context.colorPalette.white,
                              onChanged: (value) {
                                setState(() {
                                  colorDegree = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const ForwardBubble()
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

import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/intro/select_color_screen.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
                  child: Image.asset(MyImages.visionaryJourney),
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
                "Our project was built to suit individuals with visual impairments and to empower them within the community. We will begin with you by adjusting the app settings to fit your needs.",
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      MySharedPreferences.appDirction = AppDirction.left;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectColorScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colorPalette.black1D,
                        borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                      ),
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: context.colorPalette.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Select the viewing angle that suits you best.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.colorPalette.black1D,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      MySharedPreferences.appDirction = AppDirction.right;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectColorScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colorPalette.black1D,
                        borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                      ),
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: context.colorPalette.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  MySharedPreferences.appDirction = AppDirction.normal;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectColorScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.colorPalette.black1D,
                    borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: context.colorPalette.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

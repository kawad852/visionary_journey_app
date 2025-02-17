import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/intro/select_color_screen.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_back_button.dart';

class IntroScreen extends StatefulWidget {
  final bool isEdit;

  const IntroScreen({
    super.key,
    this.isEdit = false,
  });

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void _select(String direction) {
    final isEnglish = MySharedPreferences.language == LanguageEnum.english;
    if (direction == AppDirction.right) {
      MySharedPreferences.appDirction = isEnglish ? direction : AppDirction.left;
    } else if (direction == AppDirction.left) {
      MySharedPreferences.appDirction = isEnglish ? direction : AppDirction.right;
    } else {
      MySharedPreferences.appDirction = direction;
    }
    if (widget.isEdit) {
      Navigator.pop(context);
    } else {
      context.navigate((context) {
        return const SelectColorScreen();
      });
    }
  }

  Future<void> _startAudio() async {
    final audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource('intro_${MySharedPreferences.language}.mp3'));
    // await audioPlayer.setReleaseMode(ReleaseMode.loop);
    // audioPlayer.stop();
  }

  @override
  void initState() {
    super.initState();
    if (!widget.isEdit) {
      _startAudio();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: widget.isEdit
          ? AppBar(
              forceMaterialTransparency: true,
              automaticallyImplyLeading: false,
              title: CustomBackButton(),
            )
          : null,
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
                    MyImages.visionaryJourney,
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
                context.appLocalization.introText,
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
                      _select(AppDirction.left);
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
                      context.appLocalization.selectViewText,
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
                      _select(AppDirction.right);
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
                  _select(AppDirction.normal);
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

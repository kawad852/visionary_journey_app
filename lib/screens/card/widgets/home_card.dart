import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/home_bubble.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/editors/base_editor.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: MySharedPreferences.appDirction == AppDirction.right
          ? AlignmentDirectional.centerEnd
          : MySharedPreferences.appDirction == AppDirction.left
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.center,
      child: SizedBox(
        width: MySharedPreferences.appDirction == AppDirction.normal
            ? double.infinity
            : context.mediaQuery.width * 0.65,
        child: Column(
          mainAxisAlignment: MySharedPreferences.appDirction == AppDirction.normal
              ? MainAxisAlignment.end
              : MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  HomeBubble(
                    onTap: () {},
                    icon: MyIcons.home,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: HomeBubble(
                      onTap: () {},
                      icon: MyIcons.coffee,
                    ),
                  ),
                  HomeBubble(
                    onTap: () {},
                    icon: MyIcons.weight,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 210,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              margin: MySharedPreferences.appDirction != AppDirction.normal
                  ? const EdgeInsets.symmetric(horizontal: 10)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                  bottomLeft: MySharedPreferences.appDirction != AppDirction.normal
                      ? const Radius.circular(30)
                      : const Radius.circular(0),
                  bottomRight: MySharedPreferences.appDirction != AppDirction.normal
                      ? const Radius.circular(30)
                      : const Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  BaseEditor(
                    initialValue: null,
                    filled: true,
                    fillColor: context.colorPalette.greyFB,
                    hintText: "Your current location",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: context.colorPalette.borderColor),
                    ),
                    prefixIcon: const IconButton(
                      onPressed: null,
                      icon: CustomSvg(MyIcons.location),
                    ),
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: BaseEditor(
                      initialValue: null,
                      filled: true,
                      fillColor: context.colorPalette.greyFB,
                      hintText: "location requested",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: context.colorPalette.borderColor),
                      ),
                      prefixIcon: const IconButton(
                        onPressed: null,
                        icon: CustomSvg(MyIcons.location),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  StretchedButton(
                    onPressed: () {},
                    child: Text(
                      "Book Now",
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

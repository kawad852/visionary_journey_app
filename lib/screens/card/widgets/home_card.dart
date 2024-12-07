import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/home_bubble.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

class HomeCard extends StatelessWidget {
  final VoidCallback onBook;
  final List<Widget> children;
  final VoidCallback onHomePressed;
  final VoidCallback onGymPressed;
  final VoidCallback onCoffeeHousePressed;

  const HomeCard({
    super.key,
    required this.onBook,
    required this.children,
    required this.onHomePressed,
    required this.onGymPressed,
    required this.onCoffeeHousePressed,
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  HomeBubble(
                    onTap: onHomePressed,
                    icon: MyIcons.home,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: HomeBubble(
                      onTap: onCoffeeHousePressed,
                      icon: MyIcons.coffee,
                    ),
                  ),
                  HomeBubble(
                    onTap: onGymPressed,
                    icon: MyIcons.weight,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 210,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              margin: MySharedPreferences.appDirction != AppDirction.normal ? const EdgeInsets.symmetric(horizontal: 10) : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                  bottomLeft: MySharedPreferences.appDirction != AppDirction.normal ? const Radius.circular(30) : const Radius.circular(0),
                  bottomRight: MySharedPreferences.appDirction != AppDirction.normal ? const Radius.circular(30) : const Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  ...children,
                  StretchedButton(
                    onPressed: onBook,
                    child: Text(
                      context.appLocalization.bookNow,
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

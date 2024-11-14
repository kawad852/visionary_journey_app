import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/user_text.dart';
import 'package:visionary_journey_app/utils/app_constants.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_network_image.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';

class OrderWatingDriverVertical extends StatefulWidget {
  const OrderWatingDriverVertical({super.key});

  @override
  State<OrderWatingDriverVertical> createState() => _OrderWatingDriverVerticalState();
}

class _OrderWatingDriverVerticalState extends State<OrderWatingDriverVertical> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: MySharedPreferences.appDirction == AppDirction.right
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: SizedBox(
        width: context.mediaQuery.width * 0.58,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelpBubble(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: context.colorPalette.black1D,
                borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: context.colorPalette.white,
                            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                          ),
                          child: CustomNetworkImage(
                            kFakeImage,
                            width: 60,
                            height: 60,
                            alignment: AlignmentDirectional.bottomStart,
                            radius: MyTheme.radiusTertiary,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: context.colorPalette.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const CustomSvg(MyIcons.calling),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const UserText("Moh. Ahmed"),
                              Row(
                                children: [
                                  const Expanded(
                                    child: UserText("Camry"),
                                  ),
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: context.colorPalette.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              const UserText("42-13821"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    decoration: BoxDecoration(
                      color: context.colorPalette.white,
                      borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                    ),
                    child: Column(
                      children: [
                        const LocationInfo(isVolume: false),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "The driver will arrive at your location within 2 minutes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.colorPalette.black1D,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                            onPressed: () {},
                            icon: const CustomSvg(MyIcons.volume),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 340,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: context.colorPalette.black),
                            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Column(
                                    children: List.generate(
                                      150 ~/ 2,
                                      (index) => Expanded(
                                        child: Container(
                                          height: 2,
                                          width: 1,
                                          color: index % 2 == 0
                                              ? Colors.transparent
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Transform.rotate(
                                  angle: -pi / 2,
                                  child: Image.asset(MyImages.car),
                                ),
                              ),
                              const Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: CustomSvg(MyIcons.location),
                              ),
                            ],
                          ),
                        ),
                      ],
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

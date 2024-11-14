import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/user_text.dart';
import 'package:visionary_journey_app/utils/app_constants.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_network_image.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
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
            child: const CustomNetworkImage(
              kFakeImage,
              width: 60,
              height: 60,
              radius: MyTheme.radiusTertiary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserText("Mohammed Ahmed"),
                const UserText("Vehicle number: 42-13821"),
                Row(
                  children: [
                    const Flexible(child: UserText("Toyota Camry")),
                    Container(
                      width: 18,
                      height: 18,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorPalette.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorPalette.white,
                shape: BoxShape.circle,
              ),
              child: const CustomSvg(MyIcons.calling),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:visionary_journey_app/helper/app_contact_service.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/screens/card/widgets/user_text.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_network_image.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';

class DriverInfo extends StatelessWidget {
  final Driver driver;

  const DriverInfo({
    super.key,
    required this.driver,
  });

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
            child: CustomNetworkImage(
              driver.photoURL,
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
                UserText("${driver.firstName} ${driver.lastName}"),
                UserText("${context.appLocalization.vehicleNumber}: ${driver.carDetails!.plateNum}"),
                Row(
                  children: [
                    Flexible(
                      child: UserText(driver.carDetails!.name),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(driver.carDetails!.color),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AppContactService.lunch(context, AppContactService.getPhoneNum());
            },
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

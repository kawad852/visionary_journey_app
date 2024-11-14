import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/user_info.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';

class OrderWatingDriverHorizontal extends StatefulWidget {
  final String orderStatus;
  const OrderWatingDriverHorizontal({super.key, required this.orderStatus});

  @override
  State<OrderWatingDriverHorizontal> createState() => _OrderWatingDriverHorizontalState();
}

class _OrderWatingDriverHorizontalState extends State<OrderWatingDriverHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const HelpBubble(),
        Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: context.colorPalette.black1D,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const UserInfo(),
              Container(
                width: double.infinity,
                height: 246,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                decoration: BoxDecoration(
                  color: context.colorPalette.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const LocationInfo(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        widget.orderStatus == OrderStatus.completed
                            ? "You have arrived at your destination.The cost of the ride is"
                            : "The driver will arrive at your location within 2 minutes",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: context.colorPalette.black,
                        ),
                      ),
                    ),
                    if (widget.orderStatus != OrderStatus.completed)
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
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
                              top: 10,
                              child: Image.asset(MyImages.car),
                            ),
                            const Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: CustomSvg(MyIcons.location),
                            ),
                          ],
                        ),
                      ),
                    if (widget.orderStatus == OrderStatus.completed)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: context.colorPalette.black1D,
                              borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                            ),
                            child: Text(
                              " JOD 3.60",
                              style: TextStyle(
                                color: context.colorPalette.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

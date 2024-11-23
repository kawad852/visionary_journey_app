import 'package:flutter/material.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/screens/card/widgets/driver_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/review_builder.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';

class ReviewCard extends StatelessWidget {
  final OrderModel order;

  const ReviewCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HelpBubble(),
        Container(
          width: double.infinity,
          height: 410,
          decoration: BoxDecoration(
            color: context.colorPalette.black1D,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              DriverInfo(
                driver: order.driver!,
              ),
              Container(
                width: double.infinity,
                height: 306,
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
                    LocationInfo(
                      pickLabelText: order.pickUpNameEn!,
                      arrivalLabelText: order.arrivalNameEn!,
                    ),
                    const ReviewBuilder(),
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

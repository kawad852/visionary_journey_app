import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:visionary_journey_app/helper/ui_helper.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/screens/card/widgets/driver_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/back_bubble.dart';
import 'package:visionary_journey_app/widgets/cost_bubble.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';

class OrderWaitingDriverHorizontal extends StatelessWidget {
  final OrderModel order;
  final int totalLength;
  final String pickLabelText, arrivalLabelText;

  const OrderWaitingDriverHorizontal({
    super.key,
    required this.order,
    required this.totalLength,
    required this.pickLabelText,
    required this.arrivalLabelText,
  });

  @override
  Widget build(BuildContext context) {
    final driver = order.driver!;
    var distance = 0.0;
    if (order.status == OrderStatus.driverArrived) {
      distance = 0;
    } else {
      distance = Geolocator.distanceBetween(
        driver.currentGeoPoint!.geoPoint!.latitude,
        driver.currentGeoPoint!.geoPoint!.longitude,
        order.status == OrderStatus.driverAssigned ? order.pickUp!.geoPoint!.latitude : order.arrivalGeoPoint!.geoPoint!.latitude,
        order.status == OrderStatus.driverAssigned ? order.pickUp!.geoPoint!.longitude : order.arrivalGeoPoint!.geoPoint!.longitude,
      );
    }

    final time = UiHelper.calculateETA(distance.toInt());

    var length = 40;
    var total = 40;
    if (order.status == OrderStatus.driverAssigned) {
      total = order.pickUpPolylinePoints.length;
      if (order.pickUpPolylinePoints.isNotEmpty) {
        length = order.pickUpPolylinePoints.length - order.pickUpIndex;
      }
    } else if (order.status == OrderStatus.inProgress) {
      total = order.arrivalPolylinePoints.length;
      if (order.arrivalPolylinePoints.isNotEmpty) {
        length = order.arrivalPolylinePoints.length - order.arrivalIndex;
      }
    }
    final sliderValue = UiHelper.mapToRange(distance == 0 ? 0 : length, 0, total, 1, -1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HelpBubble(),
            if (order.status == OrderStatus.completed) ...[
              BackBubble(
                onTap: () {},
              ),
            ],
          ],
        ),
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
              DriverInfo(
                driver: order.driver!,
              ),
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
                    LocationInfo(
                      pickLabelText: pickLabelText,
                      arrivalLabelText: arrivalLabelText,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        UiHelper.getText(
                          context,
                          status: order.status,
                          time: time,
                        ),
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
                    if (order.status != OrderStatus.completed)
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
                                        color: index % 2 == 0 ? Colors.transparent : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(sliderValue, 0),
                              child: Image.asset(
                                MyImages.car,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: CustomSvg(
                                MyIcons.location,
                                color: context.colorPalette.black1D,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (order.status == OrderStatus.completed)
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: CostBubble(cost: order.cost!),
                        ),
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

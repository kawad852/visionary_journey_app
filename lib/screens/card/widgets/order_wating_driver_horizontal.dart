import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/screens/card/widgets/driver_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';

class OrderWaitingDriverHorizontal extends StatelessWidget {
  final OrderModel order;
  final int pointsLength;
  final String pickLabelText, arrivalLabelText;

  const OrderWaitingDriverHorizontal({
    super.key,
    required this.order,
    required this.pointsLength,
    required this.pickLabelText,
    required this.arrivalLabelText,
  });

  int calculateETA(int distanceInMeters) {
    // Calculate ETA in minutes and round to the nearest integer
    double eta = (distanceInMeters / 8.33) / 60;
    return eta.round();
  }

  double mapToRange(int number, int minOriginal, int maxOriginal, double minNew, double maxNew) {
    final v = ((number - minOriginal) / (maxOriginal - minOriginal)) * (maxNew - minNew) + minNew;
    if (v < -1) {
      return -1;
    }
    return v;
  }

  String _getText(BuildContext context, int time) {
    if (order.status == OrderStatus.driverAssigned) {
      if (time == 0) {
        return context.appLocalization.driverAlmostThere;
      }
      return context.appLocalization.driverArrivalText1(time);
    } else if (order.status == OrderStatus.driverArrived) {
      return context.appLocalization.driverArrivedText;
    } else if (order.status == OrderStatus.inProgress) {
      if (time == 0) {
        return context.appLocalization.youAreAlmostThere(context.appLocalization.appName);
      }
      return context.appLocalization.driverArrivalText2(time);
    } else {
      return context.appLocalization.driverArrivalText3;
    }
  }

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

    final time = calculateETA(distance.toInt());

    var length = 40;
    if (order.status == OrderStatus.driverAssigned) {
      length = order.pickUpPointsLength ?? length;
    } else {
      length = order.arrivalPointsLength ?? length;
    }
    final sliderValue = mapToRange(distance == 0 ? 0 : pointsLength, 0, length, 1, -1);

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
                        _getText(context, time),
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
                              child: Image.asset(MyImages.car),
                            ),
                            const Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: CustomSvg(MyIcons.location),
                            ),
                          ],
                        ),
                      ),
                    if (order.status == OrderStatus.completed)
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

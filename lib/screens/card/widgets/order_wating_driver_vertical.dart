import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/review_builder.dart';
import 'package:visionary_journey_app/screens/card/widgets/user_text.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_images.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_network_image.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';

import '../../../helper/app_contact_service.dart';
import '../../../helper/ui_helper.dart';
import '../../../models/order/order_model.dart';
import '../../../widgets/cost_bubble.dart';

class OrderWaitingDriverVertical extends StatelessWidget {
  final OrderModel order;
  final int totalLength;
  final String pickLabelText, arrivalLabelText;

  const OrderWaitingDriverVertical({
    super.key,
    required this.order,
    required this.totalLength,
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
    final sliderValue = UiHelper.mapToRange(distance == 0 ? 0 : length, 0, total, -1, 1);

    return Align(
      alignment: MySharedPreferences.appDirction == AppDirction.right ? Alignment.centerRight : Alignment.centerLeft,
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
                            driver.photoURL,
                            width: 60,
                            height: 60,
                            alignment: AlignmentDirectional.bottomStart,
                            radius: MyTheme.radiusTertiary,
                            child: GestureDetector(
                              onTap: () {
                                AppContactService.lunch(context, AppContactService.getPhoneNum());
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: context.colorPalette.white,
                                  shape: BoxShape.circle,
                                ),
                                child: CustomSvg(
                                  MyIcons.calling,
                                  color: context.colorPalette.black1D,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserText(context.translate(textEN: driver.nameEn, textAR: driver.nameAr)),
                              Row(
                                children: [
                                  Expanded(
                                    child: UserText(
                                      context.translate(textEN: driver.carDetails!.nameEn, textAR: driver.carDetails!.nameAr),
                                    ),
                                  ),
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color: HexColor(driver.carDetails!.color),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              UserText(driver.carDetails!.plateNum),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // if (order.status != OrderStatus.completed)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    decoration: BoxDecoration(
                      color: context.colorPalette.white,
                      borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
                    ),
                    child: Column(
                      children: [
                        LocationInfo(
                          isVolume: false,
                          pickLabelText: pickLabelText,
                          arrivalLabelText: arrivalLabelText,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            UiHelper.getText(
                              context,
                              status: order.status,
                              time: time,
                            ),
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
                            onPressed: () {
                              UiHelper.read(pickLabelText);
                            },
                            icon: CustomSvg(
                              MyIcons.volume,
                              color: context.colorPalette.black1D,
                            ),
                          ),
                        ),
                        if (order.status != OrderStatus.inReview && order.status != OrderStatus.completed)
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
                                            color: index % 2 == 0 ? Colors.transparent : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, sliderValue),
                                  child: Transform.rotate(
                                    angle: -pi / 2,
                                    child: Image.asset(MyImages.car),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: CustomSvg(
                                    MyIcons.location,
                                    color: context.colorPalette.black1D,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (order.status == OrderStatus.completed)
                          CostBubble(
                            cost: order.cost!,
                            width: 150,
                            height: 50,
                          ),
                        if (order.status == OrderStatus.inReview)
                          const ReviewBuilder(
                            size: 25,
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

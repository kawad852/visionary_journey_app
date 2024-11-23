import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

import '../../models/country/country_model.dart';
import '../../utils/countries.dart';
import '../utils/enums.dart';

class UiHelper {
  static String getFlag(String code) => 'assets/flags/${code.toLowerCase()}.svg';
  static CountryModel getCountry(String code) => kCountries.firstWhere((element) => element.code == code);

  static get postCarouselOptions => CarouselOptions(
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        aspectRatio: 3,
        scrollPhysics: const NeverScrollableScrollPhysics(),
      );

  // static String orderStatusName(BuildContext context, String status) {
  //   switch (status) {
  //     case OrderStatusEnum.placed:
  //       return context.appLocalization.statusPlaced;
  //     case OrderStatusEnum.preparing:
  //       return context.appLocalization.statusPreparing;
  //     case OrderStatusEnum.outForDelivery:
  //       return context.appLocalization.statusOutForDelivery;
  //     case OrderStatusEnum.readyForPickUp:
  //       return context.appLocalization.readyForPickup;
  //     case OrderStatusEnum.completed:
  //       return context.appLocalization.statusCompleted;
  //     case OrderStatusEnum.canceled:
  //       return context.appLocalization.statusCanceled;
  //     default:
  //       return '';
  //   }
  // }

  static TimeOfDay convertStringToTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    final hour = int.parse(parts[0].trim());
    final minute = int.parse(parts[1].trim().split(' ')[0]);

    final isPm = parts[1].trim().endsWith('PM');

    // Handle 12 AM and 12 PM
    final adjustedHour = isPm
        ? (hour == 12 ? hour : hour + 12) // Keep 12 PM as 12
        : (hour == 12 ? 0 : hour); // Convert 12 AM to 0

    return TimeOfDay(hour: adjustedHour, minute: minute);
  }

  static bool isOutOfStock(int? quantity) {
    return quantity != null && quantity < 1;
  }

  static int calculateETA(int distanceInMeters) {
    // Calculate ETA in minutes and round to the nearest integer
    double eta = (distanceInMeters / 8.33) / 60;
    return eta.round();
  }

  static double mapToRange(int number, int minOriginal, int maxOriginal, double minNew, double maxNew) {
    final v = ((number - minOriginal) / (maxOriginal - minOriginal)) * (maxNew - minNew) + minNew;
    if (v < -1) {
      return -1;
    }
    return v;
  }

  static String getText(
    BuildContext context, {
    required String status,
    required int time,
  }) {
    if (status == OrderStatus.driverAssigned) {
      if (time == 0) {
        return context.appLocalization.driverAlmostThere;
      }
      return context.appLocalization.driverArrivalText1(time);
    } else if (status == OrderStatus.driverArrived) {
      return context.appLocalization.driverArrivedText;
    } else if (status == OrderStatus.inProgress) {
      if (time == 0) {
        return context.appLocalization.youAreAlmostThere(context.appLocalization.appName);
      }
      return context.appLocalization.driverArrivalText2(time);
    } else {
      return context.appLocalization.driverArrivalText3;
    }
  }

  static read(String text) {
    final flutterTts = FlutterTts();
    flutterTts.speak(text);
  }
}

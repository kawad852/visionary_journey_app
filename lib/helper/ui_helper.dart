import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/country/country_model.dart';
import '../../utils/countries.dart';

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
}

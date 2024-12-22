import 'package:flutter/material.dart';
import 'package:visionary_journey_app/helper/ui_helper.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';

class LocationInfo extends StatelessWidget {
  final bool isVolume;
  final String pickLabelText, arrivalLabelText;

  const LocationInfo({
    super.key,
    this.isVolume = true,
    required this.pickLabelText,
    required this.arrivalLabelText,
  });

  String _getDropOffEn(BuildContext context) {
    if (arrivalLabelText.contains("إلى الموقع الذي تطلبه من السائق")) {
      return context.appLocalization.locationRequestedFromDriver;
    } else if (arrivalLabelText.contains("العمل")) {
      return context.appLocalization.work;
    } else if (arrivalLabelText.contains("المقهى")) {
      return context.appLocalization.coffeeHouse;
    } else if (arrivalLabelText.contains("المنزل")) {
      return context.appLocalization.home;
    } else if (arrivalLabelText.contains("النادي الرياضي")) {
      return context.appLocalization.gym;
    }
    return arrivalLabelText;
  }

  String _getDropOffAr(BuildContext context) {
    if (arrivalLabelText.contains("To the location you request from the driver")) {
      return context.appLocalization.locationRequestedFromDriver;
    } else if (arrivalLabelText.contains("Work")) {
      return context.appLocalization.work;
    } else if (arrivalLabelText.contains("coffeeHouse")) {
      return context.appLocalization.coffeeHouse;
    } else if (arrivalLabelText.contains("Home")) {
      return context.appLocalization.home;
    } else if (arrivalLabelText.contains("Gym")) {
      return context.appLocalization.gym;
    }
    return arrivalLabelText;
  }

  @override
  Widget build(BuildContext context) {
    late String pickUp;
    late String dropOff;
    if (context.isLTR) {
      pickUp = pickLabelText.contains("موقعك الحالي") ? context.appLocalization.yourCurrentLocation : pickLabelText;
      dropOff = _getDropOffEn(context);
    } else {
      pickUp = pickLabelText.contains("Your current location") ? context.appLocalization.yourCurrentLocation : pickLabelText;
      dropOff = _getDropOffAr(context);
    }
    return Row(
      children: [
        Column(
          children: [
            CustomSvg(
              MyIcons.location,
              color: context.colorPalette.black1D,
            ),
            const CustomSvg(MyIcons.dash),
            CustomSvg(
              MyIcons.location,
              color: context.colorPalette.black1D,
            ),
          ],
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      pickUp,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.grey66,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  isVolume == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: GestureDetector(
                            onTap: () {
                              UiHelper.read(pickUp);
                            },
                            child: CustomSvg(
                              MyIcons.volume,
                              color: context.colorPalette.black1D,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                dropOff,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.colorPalette.grey66,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

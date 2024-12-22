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

  @override
  Widget build(BuildContext context) {
    final pick = pickLabelText.contains(context.appLocalization.yourCurrentLocation) ? context.appLocalization.yourCurrentLocation : pickLabelText;
    final drop = arrivalLabelText.contains(context.appLocalization.locationRequestedFromDriver) ? context.appLocalization.locationRequestedFromDriver : arrivalLabelText;
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
                      pick,
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
                              UiHelper.read(pick);
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
                drop,
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

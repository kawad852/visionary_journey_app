import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';

class LocationInfo extends StatelessWidget {
  final bool isVolume;
  const LocationInfo({super.key, this.isVolume = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Column(
          children: [
            CustomSvg(MyIcons.location),
            CustomSvg(MyIcons.dash),
            CustomSvg(MyIcons.location),
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
                      "Hayya Cultural Center",
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
                            onTap: () {},
                            child: const CustomSvg(MyIcons.volume),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "To the location you requested from the driver",
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

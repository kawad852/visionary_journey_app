import 'package:flutter/material.dart';
import 'package:visionary_journey_app/alerts/feedback/app_feedback.dart';
import 'package:visionary_journey_app/screens/card/widgets/settings.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';

class HelpBubble extends StatelessWidget {
  const HelpBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.showBottomSheet(
          context,
          maxHeight: 510,
          builder: (context) {
            return const Settings();
          },
        );
      },
      child: Container(
        width: 126,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorPalette.black1D,
                borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
              ),
              child: const CustomSvg(MyIcons.headphone),
            ),
            const SizedBox(width: 6),
            Text(
              "Need Help ?",
              style: TextStyle(
                color: context.colorPalette.black1D,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

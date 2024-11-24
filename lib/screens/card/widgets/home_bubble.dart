import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';

class HomeBubble extends StatelessWidget {
  final String icon;
  final void Function() onTap;
  const HomeBubble({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
        ),
        child: CustomSvg(
          icon,
          color: context.colorPalette.black1D,
        ),
      ),
    );
  }
}

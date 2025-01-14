import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

import '../utils/my_theme.dart';
import 'custom_svg.dart';

class CustomBubble extends StatelessWidget {
  final VoidCallback onTap;
  final String icon, label;
  final bool only;

  const CustomBubble({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    this.only = false,
  });

  Widget _buildWidget(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorPalette.black1D,
        borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
      ),
      child: Transform.flip(
        flipX: !context.isLTR,
        child: CustomSvg(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (only) {
      return GestureDetector(
        onTap: onTap,
        child: _buildWidget(context),
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 150,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
        ),
        child: Row(
          children: [
            _buildWidget(context),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: context.colorPalette.black1D,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

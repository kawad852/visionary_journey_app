import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

import '../utils/my_theme.dart';

class CostBubble extends StatelessWidget {
  final double cost;
  final double? width;
  final double height;

  const CostBubble({
    super.key,
    required this.cost,
    this.width,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colorPalette.black1D,
          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
        ),
        child: Text(
          " JOD $cost",
          style: TextStyle(
            color: context.colorPalette.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

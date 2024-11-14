import 'package:flutter/material.dart';
import 'package:visionary_journey_app/screens/intro/allow_location_screen.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';

class ForwardBubble extends StatelessWidget {
  const ForwardBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AllowLocationScreen(),
          ),
        );
      },
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colorPalette.black1D,
          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
        ),
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colorPalette.white,
            borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ),
      ),
    );
  }
}

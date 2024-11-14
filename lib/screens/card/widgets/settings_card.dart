import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';

class SettingsCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const SettingsCard({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 11),
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
        ),
        child: child,
      ),
    );
  }
}

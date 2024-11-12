import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';

import '../utils/base_extensions.dart';

class StretchedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  const StretchedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Center(
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: context.colorPalette.black1D,
            minimumSize: Size.fromHeight(context.systemButtonHeight + 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MyTheme.radiusTertiary),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

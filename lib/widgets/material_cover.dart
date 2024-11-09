import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

class MaterialCover extends StatelessWidget {
  final Widget child;
  final bool withBackgroundColor;

  const MaterialCover({
    super.key,
    required this.child,
    required this.withBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: withBackgroundColor ? MaterialType.canvas : MaterialType.transparency,
      color: context.colorScheme.surface,
      child: child,
    );
  }
}

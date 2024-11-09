import 'package:flutter/material.dart';

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
            minimumSize: Size.fromHeight(context.systemButtonHeight + 4),
          ),
          child: child,
        ),
      ),
    );
  }
}

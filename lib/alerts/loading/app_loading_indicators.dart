import 'package:flutter/material.dart';

class AppLoadingIndicator {
  // ignore: unused_field
  final BuildContext _context;

  AppLoadingIndicator(this._context);

  static of(BuildContext context) => AppLoadingIndicator(context);

  Widget circular({
    Color? color,
    bool isSmall = false,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: isSmall ? 20.0 : 37.0,
        width: isSmall ? 20.0 : 37.0,
        child: CircularProgressIndicator(
          strokeWidth: isSmall == true ? 1.8 : 4.0,
          color: color,
        ),
      ),
    );
  }

  Widget topLinear() {
    return const SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      ),
    );
  }
}

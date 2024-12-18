import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ReponsiveExtenstion on BuildContext {
  ResponsiveBreakpointsData get breakPoints => ResponsiveBreakpoints.of(this);
}

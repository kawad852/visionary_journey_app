import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/my_theme.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

class ColorPalette {
  final BuildContext _context;

  ColorPalette(this._context);

  static of(BuildContext context) => ColorPalette(context);

  bool get _isLightTheme => MyTheme.isLightTheme(_context);
  double degree = MySharedPreferences.colorDegree;

  void toggleDegree(double percent) {
    MySharedPreferences.colorDegree = percent;
    degree = percent;
  }

  ///common
  Color get white => Colors.white;
  Color get black => Colors.black.withOpacity(degree);

  //black
  Color get black1D => const Color(0xFF1D1D1D);

  Color get borderColor => const Color(0xFFF1F1F1);

  //grey
  Color get greyFB => const Color(0xFFFBFBFB);
  Color get grey66 => const Color(0xFF666666);
}

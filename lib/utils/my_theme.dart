import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/base_extensions.dart';

const kMaxWidth = 800.0;
const kEditorBottomPadding = 20.0;

class MyTheme {
  static final String fontFamily = GoogleFonts.cairo().fontFamily!;

  static const double radiusPrimary = 20;
  static const double radiusSecondary = 16;
  static const double radiusTertiary = 10;

  static bool isLightTheme(BuildContext context) => context.colorScheme.brightness == Brightness.light;

  static Color surfaceTintColor(BuildContext context) => ElevationOverlay.applySurfaceTint(
        context.colorScheme.surface,
        context.colorScheme.surfaceTint,
        1,
      );

  ThemeData materialTheme(BuildContext context, ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      drawerTheme: const DrawerThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
      dataTableTheme: const DataTableThemeData(
        headingTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.surfaceContainerHigh,
      ),
      inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints(maxWidth: kMaxWidth),
        filled: true,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSecondary),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSecondary),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSecondary),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSecondary),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSecondary),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
    );
  }
}

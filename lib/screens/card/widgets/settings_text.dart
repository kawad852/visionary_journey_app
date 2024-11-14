import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

class SettingsText extends StatelessWidget {
  final String data;
  const SettingsText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: context.colorPalette.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

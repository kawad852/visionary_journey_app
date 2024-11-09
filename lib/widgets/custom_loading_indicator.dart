import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

import 'material_cover.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final bool withBackgroundColor;

  const CustomLoadingIndicator({
    super.key,
    this.withBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialCover(
      withBackgroundColor: withBackgroundColor,
      child: Center(
        child: context.loaders.circular(),
      ),
    );
  }
}

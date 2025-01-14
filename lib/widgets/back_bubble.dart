import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/custom_bubble.dart';

class BackBubble extends StatelessWidget {
  final VoidCallback onTap;

  const BackBubble({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBubble(
      onTap: onTap,
      icon: MyIcons.arrowBack,
      label: context.appLocalization.back,
    );
  }
}

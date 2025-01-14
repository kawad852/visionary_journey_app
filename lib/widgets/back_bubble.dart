import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/custom_bubble.dart';

import '../network/my_fields.dart';

class BackBubble extends StatelessWidget {
  const BackBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBubble(
      onTap: () {
        context.userProvider.userDocRef.update({
          MyFields.orderId: null,
        });
      },
      icon: MyIcons.arrowBack,
      label: context.appLocalization.back,
    );
  }
}

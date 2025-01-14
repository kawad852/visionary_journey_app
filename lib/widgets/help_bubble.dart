import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/custom_bubble.dart';

import '../helper/app_contact_service.dart';

class HelpBubble extends StatelessWidget {
  const HelpBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBubble(
      onTap: () {
        AppContactService.lunch(context, AppContactService.whatsAppUrl);
      },
      icon: MyIcons.headphone,
      label: context.appLocalization.needHelp,
    );
  }
}

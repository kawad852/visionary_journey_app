import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';

import 'custom_svg.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;

  const BaseAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: CustomSvg(
          MyIcons.settings,
          color: context.colorPalette.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: CustomSvg(
            MyIcons.gps,
            color: context.colorPalette.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';

import '../utils/shared_pref.dart';
import 'custom_svg.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;

  const BaseAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var myDirection = MySharedPreferences.appDirction;
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: myDirection == AppDirction.normal
            ? null
            : myDirection == AppDirction.right
                ? TextDirection.rtl
                : TextDirection.ltr,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: CustomSvg(
              MyIcons.settings,
              color: context.colorPalette.black,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: CustomSvg(
              MyIcons.gps,
              color: context.colorPalette.black,
            ),
          ),
        ],
      ),
      // leading: IconButton(
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //   icon: CustomSvg(
      //     MyIcons.settings,
      //     color: context.colorPalette.black,
      //   ),
      // ),
      // actions: [
      //   IconButton(
      //     onPressed: onPressed,
      //     icon: CustomSvg(
      //       MyIcons.gps,
      //       color: context.colorPalette.black,
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';

import '../utils/enums.dart';

class NotificationsRouteHandler {
  static void toggle(
    BuildContext context, {
    required String? id,
    required String? type,
  }) {
    try {
      if (id == null) return;
      switch (type) {
        case NotificationsType.product:
        // ProductRoute(id: id, $extra: null).push(context);
        case NotificationsType.category:
          // CategoryRoute(id: id).push(context);
          break;
        default:
          break;
      }
    } catch (e) {
      debugPrint("RouteError:: $e");
    }
  }
}

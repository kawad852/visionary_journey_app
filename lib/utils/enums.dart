enum SortAction { recommended, newest, priceHigh, priceLow, popularity }

enum ActionType { add, edit, delete }

class AppDirction {
  static const String normal = 'normal';
  static const String left = 'left';
  static const String right = 'right';
}

class LanguageEnum {
  static const String english = 'en';
  static const String arabic = 'ar';
}

class ThemeEnum {
  static const String light = 'light';
  static const String dark = 'dark';
}

class NotificationsType {
  static const String? general = null;
  static const String product = 'product';
  static const String category = 'category';
}

class OrderStatus {
  static const String driverAssigned = 'DRIVER_ASSIGNED';
  static const String driverArrived = 'DRIVER_ARRIVED';
  static const String inProgress = 'IN_PROGRESS';
  static const String inReview = 'IN_REVIEW';
  static const String completed = 'COMPLETED';
}

class DriverStatus {
  static const String available = 'AVAILABLE'; // Driver is online and available to accept rides.
  static const String onTheWayToPickup = 'ON_THE_WAY_TO_PICKUP'; // Driver has accepted a ride and is heading to the pickup location.
  static const String waitingForRider = 'WAITING_FOR_RIDER'; // Driver has arrived at the pickup location and is waiting for the rider.
  static const String inRide = 'IN_RIDE'; // Driver is currently transporting the rider to the destination.
  static const String completedRide = 'COMPLETED_RIDE'; // Driver has dropped off the rider at the destination.
  static const String offline = 'OFFLINE'; // Driver is not available for rides.
  static const String cancelledRide = 'CANCELLED_RIDE'; // Driver has canceled the ride before pickup.
}

// // Define the notification payload for Firebase Messaging
// const payload = {
//   token: deviceToken,
//   android: {
//     priority: "high",
//     notification: {
//       click_action: "FLUTTER_NOTIFICATION_CLICK",
//       sound: "end_match_helf.wav",
//       channelId: "channel_id_2",
//     },
//   },
//   notification: {
//     title: title,
//     body: body,
//   },
//   data: {
//     channel_id: "channel_id_2",
//   },
// };

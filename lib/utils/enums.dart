enum SortAction { recommended, newest, priceHigh, priceLow, popularity }

enum ActionType { add, edit, delete }

class LanguageEnum {
  static const String english = 'en';
  static const String arabic = 'ar';
}

class ThemeEnum {
  static const String light = 'light';
  static const String dark = 'dark';
}

class AuthProviders {
  static const String google = 'google';
  static const String apple = 'apple';
  static const String phone = 'phone';
  static const String email = 'email';
}

class BuildingType {
  static const String house = '1';
  static const String apartment = '2';
  static const String office = '3';
}

class OrderStatusEnum {
  static const String placed = 'placed';
  static const String preparing = 'preparing';
  static const String outForDelivery = 'outForDelivery';
  static const String readyForPickUp = 'readyForPickup';
  static const String completed = 'completed';
  static const String canceled = 'canceled';
}

class MealOptionEnum {
  static const String optional = 'optional';
  static const String required = 'required';
}

class PostType {
  static const String list = 'list';
  static const String banner = 'banner';
  static const String carousel = 'carousel';
}

class OrderType {
  static const String pickUp = 'pickUp';
  static const String delivery = 'delivery';
}

class EmailJsEnum {
  static const link = 'https://api.emailjs.com/api/v1.0/email/send';
  static const serviceId = "service_85zuv8l"; // service_dga8ga8
  static const templateId = "template_4w6bflf"; //template_kibj8m3
  static const userId = "QIWycTMidTmWWH1ro"; //kdJ4pcQ38XFqx54Lk
}

class AddressPath {
  static const String basketToCheckout = 'basketToCheckout';
  static const String back = 'back';
}

class NotificationsType {
  static const String? general = null;
  static const String product = 'product';
  static const String category = 'category';
}

class PaymentMethod {
  static const String cash = 'cash';
  static const String credit = 'credit';
}

class OrderStatus {
  static const String pending = 'PENDING';
  static const String driverAssigned = 'DRIVER_ASSIGNED';
  static const String driverArrived = 'DRIVER_ARRIVED';
  static const String inProgress = 'IN_PROGRESS';
  static const String completed = 'COMPLETED';
  static const String cancelledByPassenger = 'CANCELLED_BY_PASSENGER';
  static const String cancelledByDriver = 'CANCELLED_BY_DRIVER';
  static const String noDriverAvailable = 'NO_DRIVER_AVAILABLE';
  static const String failedPayment = 'FAILED_PAYMENT';
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

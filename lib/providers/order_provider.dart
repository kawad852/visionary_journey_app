import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:visionary_journey_app/helper/my_factory.dart';
import 'package:visionary_journey_app/helper/services.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/network/api_service.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/network/my_fields.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/drivers.dart';
import 'package:visionary_journey_app/utils/enums.dart';

class OrderProvider extends ChangeNotifier {
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  late StreamSubscription streamController;
  List<Driver> drivers = [];
  OrderModel? order;

  void getNearestDriver(double lat, double lng) {
    streamController = GeoCollectionReference<Driver>(_firebaseFirestore.drivers)
        .subscribeWithin(
      center: GeoFirePoint(GeoPoint(lat, lng)),
      radiusInKm: 50,
      field: MyFields.currentGeoPoint,
      geopointFrom: (driver) => driver.currentGeoPoint!.geoPoint!,
      queryBuilder: (driver) => driver.where(MyFields.status, isEqualTo: DriverStatus.available),
    )
        .listen((docs) {
      drivers.addAll(docs.map((e) => e.data()!).toList());

      notifyListeners();
    });
  }

  void orderDriver(BuildContext context) {
    final locationProvider = context.locationProvider;
    final userProvider = context.userProvider;
    final driver = AppServices.findNearestDriver(drivers, locationProvider.latitude!, locationProvider.longitude!);
    ApiService.fetch(
      context,
      callBack: () async {
        /// timer
        final order = OrderModel(
          id: "1",
          createdAt: MyFactory.dateTime,
          driver: driver,
          userId: userProvider.user!.uid,
          status: OrderStatus.driverAssigned,
          pickUp: AppServices.getGeoModel(locationProvider.latitude!, locationProvider.longitude!),
          arrivalGeoPoint: AppServices.getGeoModel(32.048212423411975, 35.89053467532778),
        );
        _firebaseFirestore.orders.doc(order.id).set(order);
        userProvider.userDocRef.update({
          MyFields.orderId: order.id,
        });
        _firebaseFirestore.drivers.doc(driver.id).update({
          MyFields.orderId: order.id,
        });
      },
    );
  }

  Future<void> generateDrivers(
    BuildContext context, {
    double? lat,
    double? lng,
  }) async {
    final locationProvider = context.locationProvider;
    for (int i = 0; i < MyDrivers.drivers.length; i++) {
      final coordinates = MyFactory.generateRandomCoordinates(lat ?? locationProvider.latitude!, lng ?? locationProvider.longitude!);
      MyDrivers.drivers[i].currentGeoPoint = AppServices.getGeoModel(coordinates.latitude, coordinates.longitude);
    }

    for (var e in MyDrivers.drivers) {
      await FirebaseFirestore.instance.drivers.doc(e.id).set(e);
    }
  }
}

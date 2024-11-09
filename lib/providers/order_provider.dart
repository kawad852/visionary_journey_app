import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/network/my_fields.dart';
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
}

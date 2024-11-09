import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/network/my_fields.dart';

class OrderProvider extends ChangeNotifier {
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  late StreamSubscription streamController;
  List<Driver> drivers = [];

  void getNearestDriver() {
    streamController = GeoCollectionReference<Driver>(_firebaseFirestore.drivers)
        .subscribeWithin(
      center: const GeoFirePoint(GeoPoint(32.10052482284217, 36.097777226987525)),
      radiusInKm: 10,
      field: MyFields.currentGeoPoint,
      geopointFrom: (driver) => driver.currentGeoPoint!.geoPoint!,
      // strictMode: true,
      // queryBuilder: (d) => d.startAfter(drivers),
    )
        .listen((docs) {
      drivers.addAll(docs.map((e) => e.data()!).toList());
      notifyListeners();
    });
  }
}

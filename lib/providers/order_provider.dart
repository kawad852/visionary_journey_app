import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:visionary_journey_app/helper/my_factory.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
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

  GeoModel _getGeo(double lat, double lng) {
    final geoFirePoint = GeoFirePoint(GeoPoint(lat, lng));
    return GeoModel(
      geoHash: geoFirePoint.geohash,
      geoPoint: GeoPoint(geoFirePoint.latitude, geoFirePoint.longitude),
    );
  }

  Future<void> generateDrivers(BuildContext context) async {
    final locationProvider = context.locationProvider;
    for (int i = 0; i < MyDrivers.drivers.length; i++) {
      final coordinates = MyFactory.generateRandomCoordinates(locationProvider.latitude!, locationProvider.longitude!);
      MyDrivers.drivers[i].currentGeoPoint = _getGeo(coordinates.latitude, coordinates.longitude);
    }

    for (var e in MyDrivers.drivers) {
      await FirebaseFirestore.instance.drivers.doc(e.id).set(e);
    }
  }
}

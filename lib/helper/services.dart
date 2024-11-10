import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';

import '../models/order/order_model.dart';

class AppServices {
  static double calculateDistance(double startLat, double startLng, double endLat, double endLng) {
    const earthRadiusKm = 6371;

    final dLat = _degreesToRadians(endLat - startLat);
    final dLng = _degreesToRadians(endLng - startLng);

    final a = sin(dLat / 2) * sin(dLat / 2) + cos(_degreesToRadians(startLat)) * cos(_degreesToRadians(endLat)) * sin(dLng / 2) * sin(dLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadiusKm * c;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  static Driver findNearestDriver(List<Driver> drivers, double myLatitude, double myLongitude) {
    drivers.sort((a, b) {
      final distanceA = calculateDistance(myLatitude, myLongitude, a.currentGeoPoint!.geoPoint!.latitude, a.currentGeoPoint!.geoPoint!.longitude);
      final distanceB = calculateDistance(myLatitude, myLongitude, b.currentGeoPoint!.geoPoint!.latitude, b.currentGeoPoint!.geoPoint!.longitude);
      return distanceA.compareTo(distanceB);
    });

    // Return the nearest driver (first in the sorted list)
    return drivers.first;
  }

  static GeoModel getGeoModel(double lat, double lng) {
    final geoFirePoint = GeoFirePoint(GeoPoint(lat, lng));
    return GeoModel(
      geoHash: geoFirePoint.geohash,
      geoPoint: GeoPoint(geoFirePoint.latitude, geoFirePoint.longitude),
    );
  }
}

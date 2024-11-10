import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class MyFactory {
  static String get isoDate => DateTime.now().toIso8601String();
  static DateTime get dateTime => DateTime.now();
  static String get generateId => const Uuid().v1().replaceAll('-', '').toUpperCase();

  static GeoPoint generateRandomCoordinates(
    double latitude,
    double longitude, {
    double radiusInMeters = 1200,
  }) {
    final random = Random();

    // Convert radius from meters to degrees.
    double radiusInDegrees = radiusInMeters / 111320.0;

    // Generate random angle and distance.
    double angle = random.nextDouble() * 2 * pi;
    double distance = sqrt(random.nextDouble()) * radiusInDegrees;

    // Calculate new latitude and longitude.
    double newLatitude = latitude + (distance * cos(angle));
    double newLongitude = longitude + (distance * sin(angle) / cos(latitude * pi / 180));

    return GeoPoint(newLatitude, newLongitude);
  }
}

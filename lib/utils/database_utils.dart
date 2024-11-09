import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/models/user/user_model.dart';
import 'package:visionary_journey_app/utils/enums.dart';

import '../network/fire_queries.dart';

class DatabaseUtils {
  final userId = 'k5use2yUiQfFzsuGx1JbJQYYjNI2';

  final _raiiPoints = [
    const GeoPoint(32.10157743695846, 36.094977156182516),
    const GeoPoint(32.09744310559729, 36.08720117878381),
    const GeoPoint(32.09119179941786, 36.089466253135086),
  ];

  GeoModel _getGeo(double lat, double lng) {
    final geoFirePoint = GeoFirePoint(GeoPoint(lat, lng));
    return GeoModel(
      geoHash: geoFirePoint.geohash,
      geoPoint: GeoPoint(geoFirePoint.latitude, geoFirePoint.longitude),
    );
  }

  Future<void> init() async {
    try {
      final user = UserModel(
        id: "dxqfEg8kaTb97tNibPDXlkm8H7Q2",
        createdAt: DateTime.now(),
        displayName: "Khaled Awad",
        email: "kawad852@gmail.com",
        photoURL:
            "https://media.licdn.com/dms/image/v2/C4E03AQEEZUPHzQoE0A/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1623677348445?e=2147483647&v=beta&t=sqDxbsOL6qHX3U123nNUJ1EWY6noIQIEN7DuCRBtSos",
        languageCode: "en",
      );

      await FirebaseFirestore.instance.users.doc(user.id).set(user);

      final drivers = [
        Driver(
          id: "R123",
          status: DriverStatus.available,
          currentGeoPoint: _getGeo(_raiiPoints[0].latitude, _raiiPoints[0].longitude),
          firstName: "John",
          lastName: "Doe",
          photoURL: "https://example.com/johndoe.jpg",
          carDetails: CarDetails(
            name: "Toyota Prius",
            color: "Blue",
            plateNum: "ABC123",
            phoneNum: "+1234567890",
          ),
        ),
        Driver(
          id: "R456",
          status: DriverStatus.available,
          currentGeoPoint: _getGeo(_raiiPoints[1].latitude, _raiiPoints[1].longitude),
          firstName: "Alice",
          lastName: "Smith",
          photoURL: "https://example.com/alicesmith.jpg",
          carDetails: CarDetails(
            name: "Honda Civic",
            color: "Red",
            plateNum: "XYZ789",
            phoneNum: "+0987654321",
          ),
        ),
        Driver(
          id: "R789",
          status: DriverStatus.available,
          currentGeoPoint: _getGeo(_raiiPoints[2].latitude, _raiiPoints[2].longitude),
          firstName: "Bob",
          lastName: "Johnson",
          photoURL: "https://example.com/bobjohnson.jpg",
          carDetails: CarDetails(
            name: "Ford Focus",
            color: "Black",
            plateNum: "LMN456",
            phoneNum: "+1122334455",
          ),
        ),
      ];

      for (var e in drivers) {
        await FirebaseFirestore.instance.drivers.doc(e.id).set(e);
      }

      debugPrint("FINISHED SUCCESSFULLY");
    } catch (e) {
      debugPrint("error: $e");
    }
  }
}

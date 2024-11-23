import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/models/user/user_model.dart';
import 'package:visionary_journey_app/utils/app_constants.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';

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
        email: "kawad852@gmail.com",
        phoneCountryCode: kFallBackCountryCode,
        phone: "791595029",
        languageCode: LanguageEnum.english,
      );

      await FirebaseFirestore.instance.users.doc(user.id).set(user);

      // for (var e in drivers) {
      //   await FirebaseFirestore.instance.drivers.doc(e.id).set(e);
      // }

      debugPrint("FINISHED SUCCESSFULLY");
    } catch (e) {
      debugPrint("error: $e");
    }
  }

  void createFakeOrder(BuildContext context) {
    const pickUpGeo = GeoFirePoint(GeoPoint(32.10052482284217, 36.097777226987525));
    const arrivalGeo = GeoFirePoint(GeoPoint(32.071723624584614, 36.10014366249384));
    final order = OrderModel(
      id: '1',
      userId: MySharedPreferences.user!.id!,
      status: OrderStatus.driverAssigned,
      createdAt: DateTime.now(),
      driver: context.orderProvider.drivers.first,
      pickUp: GeoModel(
        geoHash: pickUpGeo.geohash,
        geoPoint: pickUpGeo.geopoint,
      ),
      arrivalGeoPoint: GeoModel(
        geoHash: arrivalGeo.geohash,
        geoPoint: arrivalGeo.geopoint,
      ),
    );

    FirebaseFirestore.instance.orders.doc(order.id).set(order);
  }

  void createUser(BuildContext context) {
    const email = "${kFallBackCountryCode}791595029_mail@visinory.com";
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: "123456",
      )
          .then((value) {
        if (context.mounted) {
          context.userProvider.register(context, value, phoneNumber: '791595029');
        }
      });
    } catch (e) {
      print("error:: $e");
    }
  }
}

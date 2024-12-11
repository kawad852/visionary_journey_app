import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/base_extensions.dart';

class MapController extends ChangeNotifier {
  MapController(
    BuildContext context, {
    required double? lat,
    required double? lng,
  }) {
    _init(context, lat: lat, lng: lng);
  }

  final googleMapCtrl = Completer<GoogleMapController>();

  late double latitude;
  late double longitude;

  void _init(
    BuildContext context, {
    required double? lat,
    required double? lng,
  }) {
    final locationProvider = context.locationProvider;
    latitude = lat ?? locationProvider.latitude!;
    longitude = lng ?? locationProvider.longitude!;
  }

  void setGeoPoint(double lat, double lng) {
    latitude = lat;
    longitude = lng;
    notifyListeners();
    animateCamera(lat, lng);
  }

  Future<void> goToMyPosition(
    BuildContext context, {
    double? lat,
    double? lng,
  }) async {
    final locationProvider = context.locationProvider;
    await animateCamera(lat ?? locationProvider.latitude!, lng ?? locationProvider.longitude!);
  }

  Future<void> animateCamera(double lat, double lng) async {
    final GoogleMapController controller = await googleMapCtrl.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 17,
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/providers/location_provider.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/custom_stream_builder.dart';

import '../../controllers/map_controller.dart';
import '../../models/order/order_model.dart';
import '../../network/my_fields.dart';
import '../../utils/enums.dart';
import '../../widgets/map_bubble.dart';

class SearchScreen extends StatefulWidget {
  final Uint8List icon;

  const SearchScreen({
    super.key,
    required this.icon,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late MapController _mapController;
  late Stream<List<DocumentSnapshot<Driver>>> _stream;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  LocationProvider get _locationProvider => context.locationProvider;
  OrderProvider get _orderProvider => context.orderProvider;

  void _getNearestDrivers() {
    _stream = GeoCollectionReference<Driver>(_firebaseFirestore.drivers).subscribeWithin(
      center: GeoFirePoint(GeoPoint(_locationProvider.latitude!, _locationProvider.longitude!)),
      radiusInKm: 50,
      field: MyFields.currentGeoPoint,
      geopointFrom: (driver) => driver.currentGeoPoint!.geoPoint!,
      queryBuilder: (driver) => driver.where(MyFields.status, isEqualTo: DriverStatus.available),
    );
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController(context, lat: _locationProvider.latitude, lng: _locationProvider.longitude);
    _orderProvider.generateDrivers(context);
    _getNearestDrivers();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        return CustomStreamBuilder(
          stream: _stream,
          onComplete: (context, snapshot) {
            final drivers = snapshot.data!;
            return MapBubble(
              controller: _mapController,
              markers: drivers.map((e) {
                final geoPoint = e.data()!.currentGeoPoint!.geoPoint!;
                return Marker(
                  markerId: MarkerId(e.id),
                  position: LatLng(geoPoint.latitude, geoPoint.longitude),
                  icon: BitmapDescriptor.fromBytes(widget.icon),
                  consumeTapEvents: true,
                );
              }).toSet(),
            );
          },
        );
      },
    );
  }
}

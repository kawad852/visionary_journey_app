import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/widgets/custom_stream_builder.dart';

import '../../controllers/map_controller.dart';
import '../../models/order/order_model.dart';
import '../../utils/app_constants.dart';
import '../../widgets/map_bubble.dart';

class OrderScreen extends StatefulWidget {
  final Uint8List icon;
  final String orderId;

  const OrderScreen({
    super.key,
    required this.icon,
    required this.orderId,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late MapController _mapController;
  late Stream<DocumentSnapshot<OrderModel>> _stream;
  Polyline? polyline;
  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;

  void _getOrder() {
    _stream = _firebaseFirestore.orders.doc(widget.orderId).snapshots();
  }

  void _getPolyLines({
    required GeoPoint pickUp,
    required GeoPoint arrival,
  }) async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: kGoogleMapKey,
        request: PolylineRequest(
          origin: PointLatLng(pickUp.latitude, pickUp.longitude),
          destination: PointLatLng(arrival.latitude, arrival.longitude),
          mode: TravelMode.driving,
          // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
        ),
      );

      setState(() {
        polyline = Polyline(
          polylineId: const PolylineId("polyline_1"),
          color: Colors.blue,
          width: 5,
          points: result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
        );
      });
    } catch (e) {
      debugPrint("polylineError:: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController(context, lat: 32.10052482284217, lng: 36.097777226987525);
    _getOrder();
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
            final order = snapshot.data!.data()!;
            final pickUp = order.pickUp;
            final arrival = order.arrivalGeoPoint;

            final points = [pickUp, arrival];
            return MapBubble(
              controller: _mapController,
              showMyPin: false,
              onMapCreated: () {
                _getPolyLines(
                  pickUp: pickUp!.geoPoint!,
                  arrival: arrival!.geoPoint!,
                );
              },
              polyLines: polyline != null
                  ? {
                      polyline!,
                    }
                  : {},
              markers: points.map((e) {
                final geoPoint = e!.geoPoint!;
                return Marker(
                  markerId: MarkerId(e.geoHash),
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

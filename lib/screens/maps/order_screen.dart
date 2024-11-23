import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/helper/services.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/providers/location_provider.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/providers/user_provider.dart';
import 'package:visionary_journey_app/screens/card/widgets/order_wating_driver_vertical.dart';
import 'package:visionary_journey_app/screens/card/widgets/review_card.dart';
import 'package:visionary_journey_app/screens/card/widgets/settings.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/enums.dart';
import 'package:visionary_journey_app/utils/shared_pref.dart';
import 'package:visionary_journey_app/widgets/custom_stream_builder.dart';

import '../../controllers/map_controller.dart';
import '../../helper/my_factory.dart';
import '../../models/order/order_model.dart';
import '../../network/my_fields.dart';
import '../../utils/app_constants.dart';
import '../../widgets/base_app_bar.dart';
import '../../widgets/map_bubble.dart';
import '../card/widgets/order_wating_driver_horizontal.dart';

class OrderScreen extends StatefulWidget {
  final Uint8List carIcon;
  final Uint8List circleIcon;
  final String orderId;

  const OrderScreen({
    super.key,
    required this.carIcon,
    required this.orderId,
    required this.circleIcon,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late MapController _mapController;
  late Stream<DocumentSnapshot<OrderModel>> _stream;
  Polyline? polyline;
  Timer? _timer;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  LocationProvider get _locationProvider => context.locationProvider;
  UserProvider get _userProvider => context.userProvider;

  void _getOrder() {
    _stream = _firebaseFirestore.orders.doc(widget.orderId).snapshots();
  }

  Future<void> _createPolyline({
    required GeoPoint end,
    required GeoPoint start,
  }) async {
    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: kGoogleMapKey,
        request: PolylineRequest(
          origin: PointLatLng(end.latitude, end.longitude),
          destination: PointLatLng(start.latitude, start.longitude),
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

  void _updatePoints({
    required Function() onUpdate,
    required Function() onEnd,
  }) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (polyline!.points.isEmpty) {
          timer.cancel();
          setState(() {
            polyline = null;
          });
          onEnd();
        } else {
          onUpdate();
        }
      },
    );
  }

  late GeoModel _lastDriverGeo;
  Future<void> _handleOrder({
    required OrderModel order,
    required String status,
  }) async {
    final driver = order.driver!;
    final pickUpGeo = order.pickUp!;
    final driverGeo = driver.currentGeoPoint!;
    final arrivalGeo = order.arrivalGeoPoint;

    if (status == OrderStatus.driverAssigned) {
      await _createPolyline(
        start: driverGeo.geoPoint!,
        end: pickUpGeo.geoPoint!,
      );
      await _firebaseFirestore.orders.doc(order.id).update({
        'pickUpPointsLength': polyline!.points.length,
      });
      _updatePoints(
        onUpdate: () async {
          final point = polyline!.points.last;
          final pointGeo = AppServices.getGeoModel(point.latitude, point.longitude);
          final bearing = Geolocator.bearingBetween(
            _lastDriverGeo.geoPoint!.latitude,
            _lastDriverGeo.geoPoint!.longitude,
            pickUpGeo.geoPoint!.latitude,
            pickUpGeo.geoPoint!.longitude,
          );
          await _firebaseFirestore.orders.doc(order.id).update({
            'driver.currentGeoPoint': pointGeo.toJson(),
            "driver.bearing": bearing,
          });
          setState(() {
            polyline!.points.removeLast();
          });
        },
        onEnd: () async {
          setState(() {
            polyline = null;
          });
          await _firebaseFirestore.orders.doc(order.id).update({
            MyFields.status: OrderStatus.driverArrived,
          });
          await Future.delayed(
            const Duration(seconds: 3),
          );
          if (order.arrivalGeoPoint == null) {
            final coordinates = MyFactory.generateRandomCoordinates(order.pickUp!.geoPoint!.latitude, order.pickUp!.geoPoint!.longitude);
            order.arrivalGeoPoint = AppServices.getGeoModel(coordinates.latitude, coordinates.longitude);
          }
          await _firebaseFirestore.orders.doc(order.id).update({
            MyFields.status: OrderStatus.inProgress,
            'arrivalGeoPoint': order.arrivalGeoPoint?.toJson(),
          });
          _handleOrder(order: order, status: OrderStatus.inProgress);
        },
      );
    }

    ///

    if (status == OrderStatus.inProgress && arrivalGeo != null) {
      await _createPolyline(
        start: pickUpGeo.geoPoint!,
        end: arrivalGeo.geoPoint!,
      );
      await _firebaseFirestore.orders.doc(order.id).update({
        'arrivalPointsLength': polyline!.points.length,
      });
      _updatePoints(
        onUpdate: () {
          final point = polyline!.points.last;
          final pointGeo = AppServices.getGeoModel(point.latitude, point.longitude);
          final bearing = Geolocator.bearingBetween(
            pointGeo.geoPoint!.latitude,
            pointGeo.geoPoint!.longitude,
            pickUpGeo.geoPoint!.latitude,
            pickUpGeo.geoPoint!.longitude,
          );
          _firebaseFirestore.orders.doc(order.id).update({
            'driver.currentGeoPoint': pointGeo.toJson(),
            "driver.bearing": bearing,
          });
          setState(() {
            polyline!.points.removeLast();
          });
        },
        onEnd: () async {
          await _firebaseFirestore.orders.doc(order.id).update({
            MyFields.status: OrderStatus.inReview,
          });
        },
      );
    }

    if (status == OrderStatus.completed) {
      await await Future.delayed(
        const Duration(seconds: 5),
      );
      await _userProvider.userDocRef.update({
        MyFields.orderId: null,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController(context, lat: _locationProvider.latitude, lng: _locationProvider.longitude);
    _getOrder();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        return CustomStreamBuilder(
          stream: _stream,
          onComplete: (context, snapshot) {
            final order = snapshot.data!.data()!;
            final driver = order.driver!;
            final pickUpGeo = order.pickUp;
            final driverGeo = driver.currentGeoPoint;
            final arrivalGeo = order.arrivalGeoPoint;

            _lastDriverGeo = driverGeo!;

            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: BaseAppBar(
                onPressed: () {
                  _mapController.goToMyPosition(context);
                },
              ),
              drawer: const SettingsScreen(),
              onDrawerChanged: (v) {
                setState(() {});
              },
              body: Stack(
                children: [
                  MapBubble(
                    controller: _mapController,
                    showMyPin: false,
                    onMapCreated: () async {
                      _handleOrder(order: order, status: order.status);
                    },
                    polyLines: polyline != null
                        ? {
                            polyline!,
                          }
                        : {},
                    markers: {
                      Marker(
                        markerId: MarkerId(pickUpGeo!.geoHash),
                        position: LatLng(pickUpGeo.geoPoint!.latitude, pickUpGeo.geoPoint!.longitude),
                        icon: BitmapDescriptor.fromBytes(widget.circleIcon),
                        consumeTapEvents: true,
                      ),
                      Marker(
                        markerId: MarkerId(driverGeo!.geoHash),
                        position: LatLng(driverGeo.geoPoint!.latitude, driverGeo.geoPoint!.longitude),
                        rotation: driver.bearing,
                        icon: BitmapDescriptor.fromBytes(widget.carIcon),
                        consumeTapEvents: true,
                      ),
                      if (order.status == OrderStatus.inProgress && arrivalGeo != null)
                        Marker(
                          markerId: MarkerId(arrivalGeo.geoHash),
                          position: LatLng(arrivalGeo.geoPoint!.latitude, arrivalGeo.geoPoint!.longitude),
                          icon: BitmapDescriptor.fromBytes(widget.circleIcon),
                          consumeTapEvents: true,
                        ),
                    },
                  ),
                  if (order.status == OrderStatus.inReview)
                    ReviewCard(
                      order: order,
                    )
                  else ...[
                    if (MySharedPreferences.appDirction == AppDirction.normal)
                      OrderWaitingDriverHorizontal(
                        order: order,
                        pointsLength: polyline?.points.length ?? 0,
                        pickLabelText: order.pickUpNameEn!,
                        arrivalLabelText: order.arrivalNameEn!,
                      )
                    else
                      Align(
                        alignment: MySharedPreferences.appDirction == AppDirction.left ? Alignment.centerLeft : Alignment.centerRight,
                        child: OrderWaitingDriverVertical(
                          order: order,
                          pointsLength: polyline?.points.length ?? 0,
                          pickLabelText: order.pickUpNameEn!,
                          arrivalLabelText: order.arrivalNameEn!,
                        ),
                      ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}

extension on double {
  double get bounded {
    if (this > 180) {
      return this - 360;
    }
    return this;
  }
}

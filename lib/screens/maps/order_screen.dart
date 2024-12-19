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
import 'package:visionary_journey_app/screens/card/widgets/settings_screen.dart';
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
  // Polyline? polyline;
  Timer? _timer;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  LocationProvider get _locationProvider => context.locationProvider;
  UserProvider get _userProvider => context.userProvider;

  void _getOrder() {
    _stream = _firebaseFirestore.orders.doc(widget.orderId).snapshots();
  }

  Future<List<PolyModel>> _createPolyline({
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

      return result.points.map((e) => PolyModel(lat: e.latitude, lng: e.longitude)).toList();
    } catch (e) {
      debugPrint("polylineError:: $e");
      throw [];
    }
  }

  Future<void> _handleOrder({
    required OrderModel order,
    required String status,
  }) async {
    final driver = order.driver!;
    final pickUpGeo = order.pickUp!;
    final driverGeo = driver.currentGeoPoint!;
    final arrivalGeo = order.arrivalGeoPoint;

    if (status == OrderStatus.driverAssigned) {
      order.pickUpPolylinePoints = await _createPolyline(
        start: driverGeo.geoPoint!,
        end: pickUpGeo.geoPoint!,
      );
      await _firebaseFirestore.orders.doc(order.id).update({
        "pickUpPolylinePoints": order.pickUpPolylinePoints.map((e) => e.toJson()).toList(),
      });
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) async {
          if (order.pickUpIndex == order.pickUpPolylinePoints.length) {
            await _firebaseFirestore.orders.doc(order.id).update({
              MyFields.status: OrderStatus.driverArrived,
            });
            if (order.arrivalGeoPoint == null) {
              final coordinates = MyFactory.generateRandomCoordinates(order.pickUp!.geoPoint!.latitude, order.pickUp!.geoPoint!.longitude);
              order.arrivalGeoPoint = AppServices.getGeoModel(coordinates.latitude, coordinates.longitude);
            }
            await Future.delayed(
              const Duration(seconds: 10),
            );
            await _firebaseFirestore.orders.doc(order.id).update({
              MyFields.status: OrderStatus.inProgress,
              'arrivalGeoPoint': order.arrivalGeoPoint?.toJson(),
            });
            _timer!.cancel();
            _handleOrder(order: order, status: OrderStatus.inProgress);
          } else {
            final point = order.pickUpPolylinePoints[(order.pickUpPolylinePoints.length - 1) - order.pickUpIndex];
            final pointGeo = AppServices.getGeoModel(point.lat, point.lng);
            await _firebaseFirestore.orders.doc(order.id).update({
              'driver.currentGeoPoint': pointGeo.toJson(),
              "pickUpIndex": FieldValue.increment(1),
            });
            order.pickUpIndex++;
            _mapController.goToMyPosition(context, lat: pointGeo.geoPoint!.latitude, lng: pointGeo.geoPoint!.longitude);
          }
        },
      );
    }

    ///
    if (status == OrderStatus.inProgress && arrivalGeo != null) {
      order.arrivalPolylinePoints = await _createPolyline(
        start: pickUpGeo.geoPoint!,
        end: arrivalGeo.geoPoint!,
      );
      await _firebaseFirestore.orders.doc(order.id).update({
        "arrivalPolylinePoints": order.arrivalPolylinePoints.map((e) => e.toJson()).toList(),
      });
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) async {
          if (order.arrivalIndex == order.arrivalPolylinePoints.length) {
            _timer!.cancel();
            await _firebaseFirestore.orders.doc(order.id).update({
              MyFields.status: OrderStatus.completed,
            });
            await Future.delayed(const Duration(seconds: 10));
            await _firebaseFirestore.orders.doc(order.id).update({
              MyFields.status: OrderStatus.inReview,
            });
          } else {
            final point = order.arrivalPolylinePoints[(order.arrivalPolylinePoints.length - 1) - order.arrivalIndex];
            final pointGeo = AppServices.getGeoModel(point.lat, point.lng);
            _firebaseFirestore.orders.doc(order.id).update({
              'driver.currentGeoPoint': pointGeo.toJson(),
              "arrivalIndex": FieldValue.increment(1),
            });
            order.arrivalIndex++;
            _mapController.goToMyPosition(context, lat: pointGeo.geoPoint!.latitude, lng: pointGeo.geoPoint!.longitude);
          }
        },
      );
    }

    // if (status == OrderStatus.inProgress && arrivalGeo != null) {
    //   await _createPolyline(
    //     start: pickUpGeo.geoPoint!,
    //     end: arrivalGeo.geoPoint!,
    //   );
    //   await _firebaseFirestore.orders.doc(order.id).update({
    //     'arrivalPointsLength': polyline!.points.length,
    //   });
    //   _updatePoints(
    //     onUpdate: () async {
    //       final point = polyline!.points.last;
    //       final pointGeo = AppServices.getGeoModel(point.latitude, point.longitude);
    //       final bearing = Geolocator.bearingBetween(
    //         pointGeo.geoPoint!.latitude,
    //         pointGeo.geoPoint!.longitude,
    //         pickUpGeo.geoPoint!.latitude,
    //         pickUpGeo.geoPoint!.longitude,
    //       );
    //       _firebaseFirestore.orders.doc(order.id).update({
    //         'driver.currentGeoPoint': pointGeo.toJson(),
    //         "driver.bearing": bearing,
    //       });
    //       _mapController.goToMyPosition(context, lat: pointGeo.geoPoint!.latitude, lng: pointGeo.geoPoint!.longitude);
    //       setState(() {
    //         polyline!.points.removeLast();
    //       });
    //     },
    //     onEnd: () async {
    //       await _firebaseFirestore.orders.doc(order.id).update({
    //         MyFields.status: OrderStatus.inReview,
    //       });
    //     },
    //   );
    // }

    // if (status == OrderStatus.inPayment) {
    //   await await Future.delayed(
    //     const Duration(seconds: 5),
    //   );
    //   await _firebaseFirestore.orders.doc(order.id).update({
    //     MyFields.status: OrderStatus.inReview,
    //   });
    // }

    if (status == OrderStatus.completed) {
      await await Future.delayed(
        const Duration(seconds: 5),
      );
      await _userProvider.userDocRef.update({
        MyFields.orderId: null,
      });
    }
  }

  (double? bearing, PolyModel? nextPoint) _bearingInfo({
    required List<PolyModel> points,
    required int index,
  }) {
    if (points.isNotEmpty && (index < points.length - 1)) {
      final currentPoint = points[index];
      final nexPoint = points[index + 1];
      final bearing = Geolocator.bearingBetween(
        currentPoint.lat,
        currentPoint.lng,
        nexPoint.lat,
        nexPoint.lng,
      );
      debugPrint("BEARING::: $bearing");
      return (bearing, nexPoint);
    }
    return (null, null);
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
            final status = order.status;
            final driver = order.driver!;
            final pickUpGeo = order.pickUp;
            final driverGeo = driver.currentGeoPoint;
            final arrivalGeo = order.arrivalGeoPoint;

            final bearingInfo = _bearingInfo(
              index: order.status == OrderStatus.driverAssigned ? order.pickUpIndex : order.arrivalIndex,
              points: order.status == OrderStatus.driverAssigned ? order.pickUpPolylinePoints : order.arrivalPolylinePoints,
            );
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
                    // zoom: 20,
                    zoomGesturesEnabled: true,
                    onMapCreated: () async {
                      _handleOrder(order: order, status: order.status);
                    },
                    polyLines: {
                      if (order.status == OrderStatus.driverAssigned)
                        Polyline(
                          polylineId: const PolylineId("polyline_1"),
                          color: context.colorPalette.black,
                          width: 5,
                          points: order.pickUpPolylinePoints.map((e) => LatLng(e.lat, e.lng)).toList(),
                        ),
                      if (order.status == OrderStatus.inProgress)
                        Polyline(
                          polylineId: const PolylineId("polyline_2"),
                          color: context.colorPalette.black,
                          width: 5,
                          points: order.arrivalPolylinePoints.map((e) => LatLng(e.lat, e.lng)).toList(),
                        )
                    },
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
                      ).copyWith(
                        rotationParam: bearingInfo.$1,
                        // positionParam: bearingInfo.$2 != null ? LatLng(bearingInfo.$2!.lat, bearingInfo.$2!.lng) : null,
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
                  if (order.status == OrderStatus.inReview && MySharedPreferences.appDirction == AppDirction.normal)
                    ReviewCard(
                      order: order,
                    )
                  else ...[
                    if (MySharedPreferences.appDirction == AppDirction.normal)
                      OrderWaitingDriverHorizontal(
                        order: order,
                        totalLength: status == OrderStatus.driverAssigned ? order.pickUpPolylinePoints.length : order.arrivalPolylinePoints.length,
                        pickLabelText: order.pickUpNameEn!,
                        arrivalLabelText: order.arrivalNameEn!,
                      )
                    else
                      Align(
                        alignment: MySharedPreferences.appDirction == AppDirction.left ? Alignment.centerLeft : Alignment.centerRight,
                        child: OrderWaitingDriverVertical(
                          order: order,
                          totalLength: status == OrderStatus.driverAssigned ? order.pickUpPolylinePoints.length : order.arrivalPolylinePoints.length,
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

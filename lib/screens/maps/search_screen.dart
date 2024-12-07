import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/helper/services.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/providers/location_provider.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/providers/user_provider.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/base_app_bar.dart';
import 'package:visionary_journey_app/widgets/custom_stream_builder.dart';

import '../../controllers/map_controller.dart';
import '../../helper/my_factory.dart';
import '../../models/order/order_model.dart';
import '../../network/my_fields.dart';
import '../../utils/app_constants.dart';
import '../../utils/enums.dart';
import '../../widgets/map_bubble.dart';
import '../card/widgets/home_card.dart';
import '../card/widgets/order_loading.dart';
import '../card/widgets/settings.dart';
import '../places_search_screen.dart';

class SearchScreen extends StatefulWidget {
  final Uint8List carIcon;
  final Uint8List circleIcon;

  const SearchScreen({
    super.key,
    required this.carIcon,
    required this.circleIcon,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late MapController _mapController;
  late Stream<List<DocumentSnapshot<Driver>>> _stream;
  bool _fakeLoading = false;
  OrderModel? _orderModel;
  bool _canceled = false;
  Polyline? polyline;
  Timer? _debounce;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  LocationProvider get _locationProvider => context.locationProvider;
  OrderProvider get _orderProvider => context.orderProvider;
  UserProvider get _userProvider => context.userProvider;

  void _getNearestDrivers() {
    _stream = GeoCollectionReference<Driver>(_firebaseFirestore.drivers).subscribeWithin(
      center: GeoFirePoint(GeoPoint(_locationProvider.latitude!, _locationProvider.longitude!)),
      radiusInKm: 50,
      field: MyFields.currentGeoPoint,
      geopointFrom: (driver) => driver.currentGeoPoint!.geoPoint!,
      queryBuilder: (driver) => driver.where(MyFields.status, isEqualTo: DriverStatus.available),
    );
  }

  void _showFakeLoading(bool status) {
    setState(() {
      _fakeLoading = status;
    });
  }

  double _generateRandomDouble() {
    final random = Random();
    double randomDouble = 2 + random.nextDouble() * (5 - 2); // Generates a double between 2 and 5
    return double.parse(randomDouble.toStringAsFixed(2)); // Rounds to 2 decimal places
  }

  Future<void> _order(List<Driver> drivers) async {
    _showFakeLoading(true);
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        _showFakeLoading(false);
      },
    );
    if (_canceled) return;
    final driver = AppServices.findNearestDriver(drivers, _orderModel!.pickUp!.geoPoint!.latitude, _orderModel!.pickUp!.geoPoint!.longitude);
    _orderModel = _orderModel!.copyWith(
      id: MyFactory.generateId,
      createdAt: MyFactory.dateTime,
      driver: driver,
      userId: _userProvider.user!.uid,
      status: OrderStatus.driverAssigned,
      cost: _generateRandomDouble(),
    );
    final batch = _firebaseFirestore.batch();
    batch.set(_firebaseFirestore.orders.doc(_orderModel!.id), _orderModel!);
    batch.update(_userProvider.userDocRef, {
      MyFields.orderId: _orderModel!.id,
    });
    batch.update(_firebaseFirestore.drivers.doc(driver.id), {
      MyFields.orderId: _orderModel!.id,
    });
    batch.commit();
  }

  Future<void> _createPolyline({
    required GeoPoint start,
    required GeoPoint end,
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
          color: context.colorPalette.black,
          width: 5,
          points: result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
        );
      });
    } catch (e) {
      debugPrint("polylineError:: $e");
    }
  }

  void _preDefinedDestinationOrder(String name) {
    final coordinates = MyFactory.generateRandomCoordinates(_orderModel!.pickUp!.geoPoint!.latitude, _orderModel!.pickUp!.geoPoint!.longitude);
    setState(() {
      _orderModel!.arrivalNameEn = name;
      _orderModel!.arrivalGeoPoint = AppServices.getGeoModel(coordinates.latitude, coordinates.longitude);
    });
    _createPolyline(
      start: _orderModel!.pickUp!.geoPoint!,
      end: _orderModel!.arrivalGeoPoint!.geoPoint!,
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
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    _orderModel ??= OrderModel(
      pickUpNameEn: context.appLocalization.yourCurrentLocation,
      arrivalNameEn: context.appLocalization.locationRequestedFromDriver,
      pickUp: AppServices.getGeoModel(_locationProvider.latitude!, _locationProvider.longitude!),
    );
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        return CustomStreamBuilder(
          stream: _stream,
          onComplete: (context, snapshot) {
            final drivers = snapshot.data!;
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
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  MapBubble(
                    controller: _mapController,
                    showMyPin: false,
                    polyLines: polyline != null ? {polyline!} : {},
                    markers: {
                      if (_orderModel?.pickUp != null)
                        Marker(
                          markerId: MarkerId(_orderModel!.pickUp!.geoHash),
                          position: LatLng(_orderModel!.pickUp!.geoPoint!.latitude, _orderModel!.pickUp!.geoPoint!.longitude),
                          icon: BitmapDescriptor.fromBytes(widget.circleIcon),
                          consumeTapEvents: true,
                        ),
                      if (_orderModel?.arrivalGeoPoint != null)
                        Marker(
                          markerId: MarkerId(_orderModel!.arrivalGeoPoint!.geoHash),
                          position: LatLng(_orderModel!.arrivalGeoPoint!.geoPoint!.latitude, _orderModel!.arrivalGeoPoint!.geoPoint!.longitude),
                          icon: BitmapDescriptor.fromBytes(widget.circleIcon),
                          consumeTapEvents: true,
                        ),
                      ...drivers.map((e) {
                        final geoPoint = e.data()!.currentGeoPoint!.geoPoint!;
                        return Marker(
                          markerId: MarkerId(e.id),
                          position: LatLng(geoPoint.latitude, geoPoint.longitude),
                          icon: BitmapDescriptor.bytes(widget.carIcon, width: 40),
                          consumeTapEvents: true,
                        );
                      }).toSet(),
                    },
                  ),
                  _fakeLoading
                      ? OrderLoading(
                          pickLabelText: _orderModel!.pickUpNameEn!,
                          arrivalLabelText: _orderModel!.arrivalNameEn!,
                          onCancel: () {
                            _canceled = true;
                            _userProvider.userDocRef.update({
                              MyFields.orderId: null,
                            });
                          },
                        )
                      : HomeCard(
                          onBook: () {
                            _order(drivers.map((e) => e.data()!).toList());
                          },
                          onHomePressed: () {
                            _preDefinedDestinationOrder(context.appLocalization.home);
                            _order(drivers.map((e) => e.data()!).toList());
                          },
                          onGymPressed: () {
                            _preDefinedDestinationOrder(context.appLocalization.gym);
                            _order(drivers.map((e) => e.data()!).toList());
                          },
                          onCoffeeHousePressed: () {
                            _preDefinedDestinationOrder(context.appLocalization.coffeeHouse);
                            _order(drivers.map((e) => e.data()!).toList());
                          },
                          children: [
                            PlacesSearchScreen(
                              callBack: (lat, lng, name) async {
                                setState(() {
                                  _orderModel!.pickUpNameEn = name;
                                  _orderModel!.pickUp = AppServices.getGeoModel(lat, lng);
                                });
                                final kLat = _orderModel!.pickUp!.geoPoint!.latitude;
                                final kLng = _orderModel!.pickUp!.geoPoint!.longitude;
                                _orderProvider.generateDrivers(
                                  context,
                                  lat: kLat,
                                  lng: kLng,
                                );
                                _mapController.goToMyPosition(
                                  context,
                                  lat: kLat,
                                  lng: kLng,
                                );
                                if (_orderModel!.arrivalGeoPoint != null) {
                                  _createPolyline(
                                    start: _orderModel!.pickUp!.geoPoint!,
                                    end: _orderModel!.arrivalGeoPoint!.geoPoint!,
                                  );
                                }
                              },
                              labelText: _orderModel!.pickUpNameEn!,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: PlacesSearchScreen(
                                callBack: (lat, lng, name) async {
                                  setState(() {
                                    _orderModel!.arrivalNameEn = name;
                                    _orderModel!.arrivalGeoPoint = AppServices.getGeoModel(lat, lng);
                                  });
                                  _createPolyline(
                                    start: _orderModel!.pickUp!.geoPoint!,
                                    end: _orderModel!.arrivalGeoPoint!.geoPoint!,
                                  );
                                },
                                labelText: _orderModel!.arrivalNameEn!,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/helper/services.dart';
import 'package:visionary_journey_app/network/fire_queries.dart';
import 'package:visionary_journey_app/providers/location_provider.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/providers/user_provider.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/custom_stream_builder.dart';

import '../../controllers/map_controller.dart';
import '../../helper/my_factory.dart';
import '../../models/order/order_model.dart';
import '../../network/my_fields.dart';
import '../../utils/enums.dart';
import '../../widgets/map_bubble.dart';
import '../card/widgets/home_card.dart';
import '../card/widgets/order_loading.dart';
import '../places_search_screen.dart';

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
  late double _selectedLat, _selectedLng;
  bool _fakeLoading = false;
  OrderModel? _orderModel;

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

  Future<void> _order(List<Driver> drivers) async {
    _showFakeLoading(true);
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        _showFakeLoading(false);
      },
    );
    final driver = AppServices.findNearestDriver(drivers, _selectedLat, _selectedLng);
    _orderModel = _orderModel!.copyWith(
      id: "1",
      createdAt: MyFactory.dateTime,
      driver: driver,
      userId: _userProvider.user!.uid,
      status: OrderStatus.driverAssigned,
      pickUp: AppServices.getGeoModel(_selectedLat, _selectedLng),
      arrivalGeoPoint: AppServices.getGeoModel(32.10011378977755, 36.08896290269402),
    );
    _firebaseFirestore.orders.doc(_orderModel!.id).set(_orderModel!);
    _userProvider.userDocRef.update({
      MyFields.orderId: _orderModel!.id,
    });
    _firebaseFirestore.drivers.doc(driver.id).update({
      MyFields.orderId: _orderModel!.id,
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedLat = _locationProvider.latitude!;
    _selectedLng = _locationProvider.longitude!;
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
    _orderModel ??= OrderModel(
      pickUpNameEn: context.appLocalization.yourCurrentLocation,
      arrivalNameEn: context.appLocalization.locationRequestedFromDriver,
    );
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        return CustomStreamBuilder(
          stream: _stream,
          onComplete: (context, snapshot) {
            final drivers = snapshot.data!;
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                forceMaterialTransparency: true,
              ),
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  MapBubble(
                    controller: _mapController,
                    onCameraMove: (position) {
                      _selectedLat = position.target.latitude;
                      _selectedLng = position.target.longitude;
                    },
                    markers: drivers.map((e) {
                      final geoPoint = e.data()!.currentGeoPoint!.geoPoint!;
                      return Marker(
                        markerId: MarkerId(e.id),
                        position: LatLng(geoPoint.latitude, geoPoint.longitude),
                        icon: BitmapDescriptor.fromBytes(widget.icon),
                        consumeTapEvents: true,
                      );
                    }).toSet(),
                  ),
                  _fakeLoading
                      ? OrderLoading(
                          onCancel: () {},
                        )
                      : HomeCard(
                          onBook: () {
                            _order(drivers.map((e) => e.data()!).toList());
                          },
                          children: [
                            PlacesSearchScreen(
                              callBack: (lat, lng, name) async {
                                setState(() {
                                  _orderModel!.pickUpNameEn = name;
                                });
                              },
                              labelText: _orderModel!.pickUpNameEn!,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: PlacesSearchScreen(
                                callBack: (lat, lng, name) async {
                                  setState(() {
                                    _orderModel!.arrivalNameEn = name;
                                  });
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

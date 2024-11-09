import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/alerts/errors/app_error_widget.dart';
import 'package:visionary_journey_app/controllers/map_controller.dart';
import 'package:visionary_journey_app/network/api_service.dart';
import 'package:visionary_journey_app/providers/location_provider.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/custom_future_builder.dart';
import 'package:visionary_journey_app/widgets/map_bubble.dart';

import '../../models/user/user_model.dart';
import '../../notifications/cloud_messaging_service.dart';
import '../../widgets/grant_location_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cloudMessagingService = CloudMessagingService();
  late MapController _mapController;
  late Future<List<dynamic>> _futures;
  LocationProvider get _locationProvider => context.locationProvider;

  OrderProvider get _orderProvider => context.orderProvider;

  Future<List<dynamic>> _fetchFutures() {
    return ApiService.build<List<dynamic>>(
      callBack: () async {
        return Future.wait([context.appProvider.markerFuture]);
      },
    );
  }

  void _initialize() {
    _futures = _fetchFutures();
  }

  @override
  void initState() {
    super.initState();
    // cloudMessagingService.init(context);
    // cloudMessagingService.requestPermission();
    // _userProvider.updateDeviceToken(context);
    // _locationProvider.determinePosition(context);
    _mapController = MapController(context, lat: null, lng: null);
    _orderProvider.getNearestDriver();
    _initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
        future: _futures,
        onComplete: (context, snapshot) {
          final marker = snapshot.data![0] as Uint8List;
          return Consumer<OrderProvider>(
            builder: (context, orderProvider, child) {
              return Scaffold(
                appBar: AppBar(),
                // floatingActionButton: FloatingActionButton(
                //   onPressed: () {
                //     DatabaseUtils().init();
                //   },
                // ),
                body: Consumer2<UserModel?, LocationProvider>(
                  builder: (context, user, locationProvider, child) {
                    if (!locationProvider.isLocationGranted) {
                      return const GrantLocationCard(
                        onPermissionGranted: null,
                      );
                    }

                    return MapBubble(
                      controller: _mapController,
                      markers: orderProvider.drivers.map((e) {
                        final geoPoint = e.currentGeoPoint!.geoPoint!;
                        return Marker(
                          markerId: MarkerId(e.id),
                          position: LatLng(geoPoint.latitude, geoPoint.longitude),
                          icon: BitmapDescriptor.fromBytes(marker),
                          consumeTapEvents: true,
                        );
                      }).toSet(),
                    );
                  },
                ),
              );
            },
          );
        },
        onError: (error) {
          return AppErrorWidget(
            error: error,
            onRetry: () {
              setState(() {
                _initialize();
              });
            },
          );
        });
  }
}

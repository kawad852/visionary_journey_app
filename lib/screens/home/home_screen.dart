import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visionary_journey_app/alerts/errors/app_error_widget.dart';
import 'package:visionary_journey_app/network/api_service.dart';
import 'package:visionary_journey_app/providers/location_provider.dart';
import 'package:visionary_journey_app/providers/order_provider.dart';
import 'package:visionary_journey_app/screens/maps/order_screen.dart';
import 'package:visionary_journey_app/screens/maps/search_screen.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/custom_future_builder.dart';

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
  late Future<List<dynamic>> _futures;

  OrderProvider get _orderProvider => context.orderProvider;

  Future<List<dynamic>> _fetchFutures() {
    return ApiService.build<List<dynamic>>(
      callBack: () async {
        final locationFuture = context.locationProvider.determinePosition(context);
        return Future.wait([context.appProvider.markerFuture, locationFuture]);
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
    // _orderProvider.getNearestDriver(32.10052482284217, 36.097777226987525);
    cloudMessagingService.requestPermission();
    cloudMessagingService.init(context);
    context.userProvider.updateDeviceToken(context);
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder(
      future: _futures,
      onComplete: (context, snapshot) {
        final markers = snapshot.data![0] as List<Uint8List>;
        final carMarker = markers[0];
        final circleMarker = markers[1];
        return Consumer2<UserModel?, LocationProvider>(
          builder: (context, user, locationProvider, child) {
            if (user == null) {
              return const SizedBox.shrink();
            }

            if (!locationProvider.isLocationGranted) {
              return const GrantLocationCard(
                onPermissionGranted: null,
              );
            }

            final hasOrder = user.orderId != null;

            return Scaffold(
              // // appBar: AppBar(),
              //
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
              //     context.userProvider.getFingerPrint(context);
              //   },
              // ),
              body: Builder(
                builder: (context) {
                  if (hasOrder) {
                    return OrderScreen(
                      carIcon: carMarker,
                      circleIcon: circleMarker,
                      orderId: user.orderId!,
                    );
                  }
                  return SearchScreen(
                    carIcon: carMarker,
                    circleIcon: circleMarker,
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
      },
    );
  }
}

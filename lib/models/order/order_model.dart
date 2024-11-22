import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:visionary_journey_app/helper/geo_point_serializer.dart';
import 'package:visionary_journey_app/helper/time_stamp_serializer.dart';

import '../../utils/enums.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@unfreezed
class OrderModel with _$OrderModel {
  factory OrderModel({
    @TimestampSerializer() DateTime? createdAt,
    @Default('') String id,
    @Default('') String userId,
    @Default('') String status,
    int? pickUpPointsLength,
    int? arrivalPointsLength,
    GeoModel? pickUp,
    String? pickUpNameEn,
    GeoModel? arrivalGeoPoint,
    String? arrivalNameEn,
    Driver? driver,
    double? cost,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}

@unfreezed
class Destination with _$Destination {
  factory Destination({
    GeoModel? geoPoint,
    @Default('') String nameEn,
    @Default('') String nameAr,
  }) = _Destination;

  factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);
}

@unfreezed
class Driver with _$Driver {
  factory Driver({
    @Default('') String id,
    @Default(DriverStatus.available) String status,
    String? orderId,
    GeoModel? currentGeoPoint,
    @Default('') String firstName,
    @Default(0.0) double bearing,
    @Default('') String lastName,
    @Default('') String photoURL,
    CarDetails? carDetails,
  }) = _Driver;

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);
}

@unfreezed
class CarDetails with _$CarDetails {
  factory CarDetails({
    @Default('') String name,
    @Default('') String color,
    @Default('') String plateNum,
    @Default('') String phoneNum,
  }) = _CarDetails;

  factory CarDetails.fromJson(Map<String, dynamic> json) => _$CarDetailsFromJson(json);
}

@unfreezed
class GeoModel with _$GeoModel {
  factory GeoModel({
    @JsonKey(name: "geohash") @Default('') String geoHash,
    @JsonKey(name: "geopoint") @GeoPointSerializer() GeoPoint? geoPoint,
  }) = _GeoModel;

  factory GeoModel.fromJson(Map<String, dynamic> json) => _$GeoModelFromJson(json);
}

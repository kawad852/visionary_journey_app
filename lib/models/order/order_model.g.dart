// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      status: json['status'] as String? ?? '',
      pickUpPointsLength: (json['pickUpPointsLength'] as num?)?.toInt(),
      arrivalPointsLength: (json['arrivalPointsLength'] as num?)?.toInt(),
      pickUp: json['pickUp'] == null
          ? null
          : GeoModel.fromJson(json['pickUp'] as Map<String, dynamic>),
      pickUpNameEn: json['pickUpNameEn'] as String?,
      arrivalGeoPoint: json['arrivalGeoPoint'] == null
          ? null
          : GeoModel.fromJson(json['arrivalGeoPoint'] as Map<String, dynamic>),
      arrivalNameEn: json['arrivalNameEn'] as String?,
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'userId': instance.userId,
      'status': instance.status,
      'pickUpPointsLength': instance.pickUpPointsLength,
      'arrivalPointsLength': instance.arrivalPointsLength,
      'pickUp': instance.pickUp?.toJson(),
      'pickUpNameEn': instance.pickUpNameEn,
      'arrivalGeoPoint': instance.arrivalGeoPoint?.toJson(),
      'arrivalNameEn': instance.arrivalNameEn,
      'driver': instance.driver?.toJson(),
    };

_$DestinationImpl _$$DestinationImplFromJson(Map<String, dynamic> json) =>
    _$DestinationImpl(
      geoPoint: json['geoPoint'] == null
          ? null
          : GeoModel.fromJson(json['geoPoint'] as Map<String, dynamic>),
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
    );

Map<String, dynamic> _$$DestinationImplToJson(_$DestinationImpl instance) =>
    <String, dynamic>{
      'geoPoint': instance.geoPoint?.toJson(),
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
    };

_$DriverImpl _$$DriverImplFromJson(Map<String, dynamic> json) => _$DriverImpl(
      id: json['id'] as String? ?? '',
      status: json['status'] as String? ?? DriverStatus.available,
      orderId: json['orderId'] as String?,
      currentGeoPoint: json['currentGeoPoint'] == null
          ? null
          : GeoModel.fromJson(json['currentGeoPoint'] as Map<String, dynamic>),
      firstName: json['firstName'] as String? ?? '',
      bearing: (json['bearing'] as num?)?.toDouble() ?? 0.0,
      lastName: json['lastName'] as String? ?? '',
      photoURL: json['photoURL'] as String? ?? '',
      carDetails: json['carDetails'] == null
          ? null
          : CarDetails.fromJson(json['carDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DriverImplToJson(_$DriverImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'orderId': instance.orderId,
      'currentGeoPoint': instance.currentGeoPoint?.toJson(),
      'firstName': instance.firstName,
      'bearing': instance.bearing,
      'lastName': instance.lastName,
      'photoURL': instance.photoURL,
      'carDetails': instance.carDetails?.toJson(),
    };

_$CarDetailsImpl _$$CarDetailsImplFromJson(Map<String, dynamic> json) =>
    _$CarDetailsImpl(
      name: json['name'] as String? ?? '',
      color: json['color'] as String? ?? '',
      plateNum: json['plateNum'] as String? ?? '',
      phoneNum: json['phoneNum'] as String? ?? '',
    );

Map<String, dynamic> _$$CarDetailsImplToJson(_$CarDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'plateNum': instance.plateNum,
      'phoneNum': instance.phoneNum,
    };

_$GeoModelImpl _$$GeoModelImplFromJson(Map<String, dynamic> json) =>
    _$GeoModelImpl(
      geoHash: json['geohash'] as String? ?? '',
      geoPoint: const GeoPointSerializer().fromJson(json['geopoint']),
    );

Map<String, dynamic> _$$GeoModelImplToJson(_$GeoModelImpl instance) =>
    <String, dynamic>{
      'geohash': instance.geoHash,
      'geopoint': const GeoPointSerializer().toJson(instance.geoPoint),
    };

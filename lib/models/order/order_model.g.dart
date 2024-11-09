// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      createdAt: json['createdAt'] as String? ?? '',
      id: json['id'] as String? ?? '',
      status: json['status'] as String? ?? '',
      pickUp: json['pickUp'] == null
          ? null
          : Destination.fromJson(json['pickUp'] as Map<String, dynamic>),
      arrivalGeoPoint: json['arrivalGeoPoint'] == null
          ? null
          : GeoModel.fromJson(json['arrivalGeoPoint'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'status': instance.status,
      'pickUp': instance.pickUp?.toJson(),
      'arrivalGeoPoint': instance.arrivalGeoPoint?.toJson(),
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
      currentGeoPoint: json['currentGeoPoint'] == null
          ? null
          : GeoModel.fromJson(json['currentGeoPoint'] as Map<String, dynamic>),
      firstName: json['firstName'] as String? ?? '',
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
      'currentGeoPoint': instance.currentGeoPoint?.toJson(),
      'firstName': instance.firstName,
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

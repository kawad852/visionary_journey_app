// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      id: json['id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      deviceToken: json['deviceToken'] as String?,
      phoneCountryCode: json['phoneCountryCode'] as String?,
      orderId: json['orderId'] as String?,
      blocked: json['blocked'] as bool? ?? false,
      languageCode: json['languageCode'] as String? ?? LanguageEnum.english,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'deviceToken': instance.deviceToken,
      'phoneCountryCode': instance.phoneCountryCode,
      'orderId': instance.orderId,
      'blocked': instance.blocked,
      'languageCode': instance.languageCode,
    };

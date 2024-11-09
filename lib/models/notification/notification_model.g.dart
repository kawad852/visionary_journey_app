// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      data: json['data'] == null
          ? null
          : NotificationDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
      topic: json['topic'] as String?,
      notification: json['notification'] == null
          ? null
          : NotificationHeaderModel.fromJson(
              json['notification'] as Map<String, dynamic>),
      priority: json['priority'] as String? ?? "high",
      clickAction:
          json['click_action'] as String? ?? "FLUTTER_NOTIFICATION_CLICK",
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'topic': instance.topic,
      'notification': instance.notification?.toJson(),
      'priority': instance.priority,
      'click_action': instance.clickAction,
    };

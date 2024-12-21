import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helper/time_stamp_serializer.dart';
import '../../utils/enums.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@unfreezed
class UserModel with _$UserModel {
  factory UserModel({
    @TimestampSerializer() DateTime? createdAt,
    String? id,
    String? email,
    String? phone,
    String? deviceToken,
    String? phoneCountryCode,
    String? orderId,
    @Default("MALE") String gender,
    String? fingerPrint,
    @Default(false) bool blocked,
    @Default(true) bool activateSounds,
    @Default(LanguageEnum.arabic) String languageCode,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

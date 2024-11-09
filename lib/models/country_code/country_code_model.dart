import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code_model.freezed.dart';
part 'country_code_model.g.dart';

@unfreezed
class CountryCodeModel with _$CountryCodeModel {
  factory CountryCodeModel({
    String? ip,
    String? countryCode,
    String? country,
  }) = _CountryCodeModel;

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) => _$CountryCodeModelFromJson(json);
}

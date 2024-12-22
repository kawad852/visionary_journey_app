// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  int get pickUpIndex => throw _privateConstructorUsedError;
  set pickUpIndex(int value) => throw _privateConstructorUsedError;
  int get arrivalIndex => throw _privateConstructorUsedError;
  set arrivalIndex(int value) =>
      throw _privateConstructorUsedError; // int? pickUpPointsLength,
// int? arrivalPointsLength,
  GeoModel? get pickUp =>
      throw _privateConstructorUsedError; // int? pickUpPointsLength,
// int? arrivalPointsLength,
  set pickUp(GeoModel? value) => throw _privateConstructorUsedError;
  String? get pickUpNameEn => throw _privateConstructorUsedError;
  set pickUpNameEn(String? value) => throw _privateConstructorUsedError;
  GeoModel? get arrivalGeoPoint => throw _privateConstructorUsedError;
  set arrivalGeoPoint(GeoModel? value) => throw _privateConstructorUsedError;
  String? get arrivalNameEn => throw _privateConstructorUsedError;
  set arrivalNameEn(String? value) => throw _privateConstructorUsedError;
  Driver? get driver => throw _privateConstructorUsedError;
  set driver(Driver? value) => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  set cost(double? value) => throw _privateConstructorUsedError;
  List<PolyModel> get pickUpPolylinePoints =>
      throw _privateConstructorUsedError;
  set pickUpPolylinePoints(List<PolyModel> value) =>
      throw _privateConstructorUsedError;
  List<PolyModel> get arrivalPolylinePoints =>
      throw _privateConstructorUsedError;
  set arrivalPolylinePoints(List<PolyModel> value) =>
      throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String userId,
      String status,
      int pickUpIndex,
      int arrivalIndex,
      GeoModel? pickUp,
      String? pickUpNameEn,
      GeoModel? arrivalGeoPoint,
      String? arrivalNameEn,
      Driver? driver,
      double? cost,
      List<PolyModel> pickUpPolylinePoints,
      List<PolyModel> arrivalPolylinePoints});

  $GeoModelCopyWith<$Res>? get pickUp;
  $GeoModelCopyWith<$Res>? get arrivalGeoPoint;
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? pickUpIndex = null,
    Object? arrivalIndex = null,
    Object? pickUp = freezed,
    Object? pickUpNameEn = freezed,
    Object? arrivalGeoPoint = freezed,
    Object? arrivalNameEn = freezed,
    Object? driver = freezed,
    Object? cost = freezed,
    Object? pickUpPolylinePoints = null,
    Object? arrivalPolylinePoints = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpIndex: null == pickUpIndex
          ? _value.pickUpIndex
          : pickUpIndex // ignore: cast_nullable_to_non_nullable
              as int,
      arrivalIndex: null == arrivalIndex
          ? _value.arrivalIndex
          : arrivalIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pickUp: freezed == pickUp
          ? _value.pickUp
          : pickUp // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      pickUpNameEn: freezed == pickUpNameEn
          ? _value.pickUpNameEn
          : pickUpNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalGeoPoint: freezed == arrivalGeoPoint
          ? _value.arrivalGeoPoint
          : arrivalGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      arrivalNameEn: freezed == arrivalNameEn
          ? _value.arrivalNameEn
          : arrivalNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      pickUpPolylinePoints: null == pickUpPolylinePoints
          ? _value.pickUpPolylinePoints
          : pickUpPolylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PolyModel>,
      arrivalPolylinePoints: null == arrivalPolylinePoints
          ? _value.arrivalPolylinePoints
          : arrivalPolylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PolyModel>,
    ) as $Val);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoModelCopyWith<$Res>? get pickUp {
    if (_value.pickUp == null) {
      return null;
    }

    return $GeoModelCopyWith<$Res>(_value.pickUp!, (value) {
      return _then(_value.copyWith(pickUp: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoModelCopyWith<$Res>? get arrivalGeoPoint {
    if (_value.arrivalGeoPoint == null) {
      return null;
    }

    return $GeoModelCopyWith<$Res>(_value.arrivalGeoPoint!, (value) {
      return _then(_value.copyWith(arrivalGeoPoint: value) as $Val);
    });
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriverCopyWith<$Res>? get driver {
    if (_value.driver == null) {
      return null;
    }

    return $DriverCopyWith<$Res>(_value.driver!, (value) {
      return _then(_value.copyWith(driver: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String userId,
      String status,
      int pickUpIndex,
      int arrivalIndex,
      GeoModel? pickUp,
      String? pickUpNameEn,
      GeoModel? arrivalGeoPoint,
      String? arrivalNameEn,
      Driver? driver,
      double? cost,
      List<PolyModel> pickUpPolylinePoints,
      List<PolyModel> arrivalPolylinePoints});

  @override
  $GeoModelCopyWith<$Res>? get pickUp;
  @override
  $GeoModelCopyWith<$Res>? get arrivalGeoPoint;
  @override
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? pickUpIndex = null,
    Object? arrivalIndex = null,
    Object? pickUp = freezed,
    Object? pickUpNameEn = freezed,
    Object? arrivalGeoPoint = freezed,
    Object? arrivalNameEn = freezed,
    Object? driver = freezed,
    Object? cost = freezed,
    Object? pickUpPolylinePoints = null,
    Object? arrivalPolylinePoints = null,
  }) {
    return _then(_$OrderModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpIndex: null == pickUpIndex
          ? _value.pickUpIndex
          : pickUpIndex // ignore: cast_nullable_to_non_nullable
              as int,
      arrivalIndex: null == arrivalIndex
          ? _value.arrivalIndex
          : arrivalIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pickUp: freezed == pickUp
          ? _value.pickUp
          : pickUp // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      pickUpNameEn: freezed == pickUpNameEn
          ? _value.pickUpNameEn
          : pickUpNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalGeoPoint: freezed == arrivalGeoPoint
          ? _value.arrivalGeoPoint
          : arrivalGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      arrivalNameEn: freezed == arrivalNameEn
          ? _value.arrivalNameEn
          : arrivalNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      pickUpPolylinePoints: null == pickUpPolylinePoints
          ? _value.pickUpPolylinePoints
          : pickUpPolylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PolyModel>,
      arrivalPolylinePoints: null == arrivalPolylinePoints
          ? _value.arrivalPolylinePoints
          : arrivalPolylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PolyModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {@TimestampSerializer() this.createdAt,
      this.id = '',
      this.userId = '',
      this.status = '',
      this.pickUpIndex = 0,
      this.arrivalIndex = 0,
      this.pickUp,
      this.pickUpNameEn,
      this.arrivalGeoPoint,
      this.arrivalNameEn,
      this.driver,
      this.cost,
      this.pickUpPolylinePoints = const [],
      this.arrivalPolylinePoints = const []});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String userId;
  @override
  @JsonKey()
  String status;
  @override
  @JsonKey()
  int pickUpIndex;
  @override
  @JsonKey()
  int arrivalIndex;
// int? pickUpPointsLength,
// int? arrivalPointsLength,
  @override
  GeoModel? pickUp;
  @override
  String? pickUpNameEn;
  @override
  GeoModel? arrivalGeoPoint;
  @override
  String? arrivalNameEn;
  @override
  Driver? driver;
  @override
  double? cost;
  @override
  @JsonKey()
  List<PolyModel> pickUpPolylinePoints;
  @override
  @JsonKey()
  List<PolyModel> arrivalPolylinePoints;

  @override
  String toString() {
    return 'OrderModel(createdAt: $createdAt, id: $id, userId: $userId, status: $status, pickUpIndex: $pickUpIndex, arrivalIndex: $arrivalIndex, pickUp: $pickUp, pickUpNameEn: $pickUpNameEn, arrivalGeoPoint: $arrivalGeoPoint, arrivalNameEn: $arrivalNameEn, driver: $driver, cost: $cost, pickUpPolylinePoints: $pickUpPolylinePoints, arrivalPolylinePoints: $arrivalPolylinePoints)';
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {@TimestampSerializer() DateTime? createdAt,
      String id,
      String userId,
      String status,
      int pickUpIndex,
      int arrivalIndex,
      GeoModel? pickUp,
      String? pickUpNameEn,
      GeoModel? arrivalGeoPoint,
      String? arrivalNameEn,
      Driver? driver,
      double? cost,
      List<PolyModel> pickUpPolylinePoints,
      List<PolyModel> arrivalPolylinePoints}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get userId;
  set userId(String value);
  @override
  String get status;
  set status(String value);
  @override
  int get pickUpIndex;
  set pickUpIndex(int value);
  @override
  int get arrivalIndex;
  set arrivalIndex(int value); // int? pickUpPointsLength,
// int? arrivalPointsLength,
  @override
  GeoModel? get pickUp; // int? pickUpPointsLength,
// int? arrivalPointsLength,
  set pickUp(GeoModel? value);
  @override
  String? get pickUpNameEn;
  set pickUpNameEn(String? value);
  @override
  GeoModel? get arrivalGeoPoint;
  set arrivalGeoPoint(GeoModel? value);
  @override
  String? get arrivalNameEn;
  set arrivalNameEn(String? value);
  @override
  Driver? get driver;
  set driver(Driver? value);
  @override
  double? get cost;
  set cost(double? value);
  @override
  List<PolyModel> get pickUpPolylinePoints;
  set pickUpPolylinePoints(List<PolyModel> value);
  @override
  List<PolyModel> get arrivalPolylinePoints;
  set arrivalPolylinePoints(List<PolyModel> value);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return _Destination.fromJson(json);
}

/// @nodoc
mixin _$Destination {
  GeoModel? get geoPoint => throw _privateConstructorUsedError;
  set geoPoint(GeoModel? value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;

  /// Serializes this Destination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DestinationCopyWith<Destination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationCopyWith<$Res> {
  factory $DestinationCopyWith(
          Destination value, $Res Function(Destination) then) =
      _$DestinationCopyWithImpl<$Res, Destination>;
  @useResult
  $Res call({GeoModel? geoPoint, String nameEn, String nameAr});

  $GeoModelCopyWith<$Res>? get geoPoint;
}

/// @nodoc
class _$DestinationCopyWithImpl<$Res, $Val extends Destination>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = freezed,
    Object? nameEn = null,
    Object? nameAr = null,
  }) {
    return _then(_value.copyWith(
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoModelCopyWith<$Res>? get geoPoint {
    if (_value.geoPoint == null) {
      return null;
    }

    return $GeoModelCopyWith<$Res>(_value.geoPoint!, (value) {
      return _then(_value.copyWith(geoPoint: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DestinationImplCopyWith<$Res>
    implements $DestinationCopyWith<$Res> {
  factory _$$DestinationImplCopyWith(
          _$DestinationImpl value, $Res Function(_$DestinationImpl) then) =
      __$$DestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeoModel? geoPoint, String nameEn, String nameAr});

  @override
  $GeoModelCopyWith<$Res>? get geoPoint;
}

/// @nodoc
class __$$DestinationImplCopyWithImpl<$Res>
    extends _$DestinationCopyWithImpl<$Res, _$DestinationImpl>
    implements _$$DestinationImplCopyWith<$Res> {
  __$$DestinationImplCopyWithImpl(
      _$DestinationImpl _value, $Res Function(_$DestinationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = freezed,
    Object? nameEn = null,
    Object? nameAr = null,
  }) {
    return _then(_$DestinationImpl(
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DestinationImpl implements _Destination {
  _$DestinationImpl({this.geoPoint, this.nameEn = '', this.nameAr = ''});

  factory _$DestinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DestinationImplFromJson(json);

  @override
  GeoModel? geoPoint;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;

  @override
  String toString() {
    return 'Destination(geoPoint: $geoPoint, nameEn: $nameEn, nameAr: $nameAr)';
  }

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      __$$DestinationImplCopyWithImpl<_$DestinationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DestinationImplToJson(
      this,
    );
  }
}

abstract class _Destination implements Destination {
  factory _Destination({GeoModel? geoPoint, String nameEn, String nameAr}) =
      _$DestinationImpl;

  factory _Destination.fromJson(Map<String, dynamic> json) =
      _$DestinationImpl.fromJson;

  @override
  GeoModel? get geoPoint;
  set geoPoint(GeoModel? value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);

  /// Create a copy of Destination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return _Driver.fromJson(json);
}

/// @nodoc
mixin _$Driver {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  GeoModel? get currentGeoPoint => throw _privateConstructorUsedError;
  set currentGeoPoint(GeoModel? value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  double get bearing => throw _privateConstructorUsedError;
  set bearing(double value) => throw _privateConstructorUsedError;
  String get photoURL => throw _privateConstructorUsedError;
  set photoURL(String value) => throw _privateConstructorUsedError;
  CarDetails? get carDetails => throw _privateConstructorUsedError;
  set carDetails(CarDetails? value) => throw _privateConstructorUsedError;

  /// Serializes this Driver to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverCopyWith<Driver> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverCopyWith<$Res> {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) then) =
      _$DriverCopyWithImpl<$Res, Driver>;
  @useResult
  $Res call(
      {String id,
      String status,
      GeoModel? currentGeoPoint,
      String nameEn,
      String nameAr,
      double bearing,
      String photoURL,
      CarDetails? carDetails});

  $GeoModelCopyWith<$Res>? get currentGeoPoint;
  $CarDetailsCopyWith<$Res>? get carDetails;
}

/// @nodoc
class _$DriverCopyWithImpl<$Res, $Val extends Driver>
    implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? currentGeoPoint = freezed,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? bearing = null,
    Object? photoURL = null,
    Object? carDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      currentGeoPoint: freezed == currentGeoPoint
          ? _value.currentGeoPoint
          : currentGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      bearing: null == bearing
          ? _value.bearing
          : bearing // ignore: cast_nullable_to_non_nullable
              as double,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      carDetails: freezed == carDetails
          ? _value.carDetails
          : carDetails // ignore: cast_nullable_to_non_nullable
              as CarDetails?,
    ) as $Val);
  }

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoModelCopyWith<$Res>? get currentGeoPoint {
    if (_value.currentGeoPoint == null) {
      return null;
    }

    return $GeoModelCopyWith<$Res>(_value.currentGeoPoint!, (value) {
      return _then(_value.copyWith(currentGeoPoint: value) as $Val);
    });
  }

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CarDetailsCopyWith<$Res>? get carDetails {
    if (_value.carDetails == null) {
      return null;
    }

    return $CarDetailsCopyWith<$Res>(_value.carDetails!, (value) {
      return _then(_value.copyWith(carDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriverImplCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$$DriverImplCopyWith(
          _$DriverImpl value, $Res Function(_$DriverImpl) then) =
      __$$DriverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      GeoModel? currentGeoPoint,
      String nameEn,
      String nameAr,
      double bearing,
      String photoURL,
      CarDetails? carDetails});

  @override
  $GeoModelCopyWith<$Res>? get currentGeoPoint;
  @override
  $CarDetailsCopyWith<$Res>? get carDetails;
}

/// @nodoc
class __$$DriverImplCopyWithImpl<$Res>
    extends _$DriverCopyWithImpl<$Res, _$DriverImpl>
    implements _$$DriverImplCopyWith<$Res> {
  __$$DriverImplCopyWithImpl(
      _$DriverImpl _value, $Res Function(_$DriverImpl) _then)
      : super(_value, _then);

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? currentGeoPoint = freezed,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? bearing = null,
    Object? photoURL = null,
    Object? carDetails = freezed,
  }) {
    return _then(_$DriverImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      currentGeoPoint: freezed == currentGeoPoint
          ? _value.currentGeoPoint
          : currentGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      bearing: null == bearing
          ? _value.bearing
          : bearing // ignore: cast_nullable_to_non_nullable
              as double,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      carDetails: freezed == carDetails
          ? _value.carDetails
          : carDetails // ignore: cast_nullable_to_non_nullable
              as CarDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverImpl implements _Driver {
  _$DriverImpl(
      {this.id = '',
      this.status = DriverStatus.available,
      this.currentGeoPoint,
      this.nameEn = "",
      this.nameAr = "",
      this.bearing = 0.0,
      this.photoURL = '',
      this.carDetails});

  factory _$DriverImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverImplFromJson(json);

  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String status;
  @override
  GeoModel? currentGeoPoint;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  double bearing;
  @override
  @JsonKey()
  String photoURL;
  @override
  CarDetails? carDetails;

  @override
  String toString() {
    return 'Driver(id: $id, status: $status, currentGeoPoint: $currentGeoPoint, nameEn: $nameEn, nameAr: $nameAr, bearing: $bearing, photoURL: $photoURL, carDetails: $carDetails)';
  }

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      __$$DriverImplCopyWithImpl<_$DriverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverImplToJson(
      this,
    );
  }
}

abstract class _Driver implements Driver {
  factory _Driver(
      {String id,
      String status,
      GeoModel? currentGeoPoint,
      String nameEn,
      String nameAr,
      double bearing,
      String photoURL,
      CarDetails? carDetails}) = _$DriverImpl;

  factory _Driver.fromJson(Map<String, dynamic> json) = _$DriverImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get status;
  set status(String value);
  @override
  GeoModel? get currentGeoPoint;
  set currentGeoPoint(GeoModel? value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  double get bearing;
  set bearing(double value);
  @override
  String get photoURL;
  set photoURL(String value);
  @override
  CarDetails? get carDetails;
  set carDetails(CarDetails? value);

  /// Create a copy of Driver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarDetails _$CarDetailsFromJson(Map<String, dynamic> json) {
  return _CarDetails.fromJson(json);
}

/// @nodoc
mixin _$CarDetails {
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  set color(String value) => throw _privateConstructorUsedError;
  String get plateNum => throw _privateConstructorUsedError;
  set plateNum(String value) => throw _privateConstructorUsedError;
  String get phoneNum => throw _privateConstructorUsedError;
  set phoneNum(String value) => throw _privateConstructorUsedError;

  /// Serializes this CarDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarDetailsCopyWith<CarDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarDetailsCopyWith<$Res> {
  factory $CarDetailsCopyWith(
          CarDetails value, $Res Function(CarDetails) then) =
      _$CarDetailsCopyWithImpl<$Res, CarDetails>;
  @useResult
  $Res call(
      {String nameEn,
      String nameAr,
      String color,
      String plateNum,
      String phoneNum});
}

/// @nodoc
class _$CarDetailsCopyWithImpl<$Res, $Val extends CarDetails>
    implements $CarDetailsCopyWith<$Res> {
  _$CarDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameEn = null,
    Object? nameAr = null,
    Object? color = null,
    Object? plateNum = null,
    Object? phoneNum = null,
  }) {
    return _then(_value.copyWith(
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      plateNum: null == plateNum
          ? _value.plateNum
          : plateNum // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNum: null == phoneNum
          ? _value.phoneNum
          : phoneNum // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarDetailsImplCopyWith<$Res>
    implements $CarDetailsCopyWith<$Res> {
  factory _$$CarDetailsImplCopyWith(
          _$CarDetailsImpl value, $Res Function(_$CarDetailsImpl) then) =
      __$$CarDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nameEn,
      String nameAr,
      String color,
      String plateNum,
      String phoneNum});
}

/// @nodoc
class __$$CarDetailsImplCopyWithImpl<$Res>
    extends _$CarDetailsCopyWithImpl<$Res, _$CarDetailsImpl>
    implements _$$CarDetailsImplCopyWith<$Res> {
  __$$CarDetailsImplCopyWithImpl(
      _$CarDetailsImpl _value, $Res Function(_$CarDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameEn = null,
    Object? nameAr = null,
    Object? color = null,
    Object? plateNum = null,
    Object? phoneNum = null,
  }) {
    return _then(_$CarDetailsImpl(
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      plateNum: null == plateNum
          ? _value.plateNum
          : plateNum // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNum: null == phoneNum
          ? _value.phoneNum
          : phoneNum // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarDetailsImpl implements _CarDetails {
  _$CarDetailsImpl(
      {this.nameEn = '',
      this.nameAr = '',
      this.color = '',
      this.plateNum = '',
      this.phoneNum = ''});

  factory _$CarDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarDetailsImplFromJson(json);

  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  String color;
  @override
  @JsonKey()
  String plateNum;
  @override
  @JsonKey()
  String phoneNum;

  @override
  String toString() {
    return 'CarDetails(nameEn: $nameEn, nameAr: $nameAr, color: $color, plateNum: $plateNum, phoneNum: $phoneNum)';
  }

  /// Create a copy of CarDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarDetailsImplCopyWith<_$CarDetailsImpl> get copyWith =>
      __$$CarDetailsImplCopyWithImpl<_$CarDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarDetailsImplToJson(
      this,
    );
  }
}

abstract class _CarDetails implements CarDetails {
  factory _CarDetails(
      {String nameEn,
      String nameAr,
      String color,
      String plateNum,
      String phoneNum}) = _$CarDetailsImpl;

  factory _CarDetails.fromJson(Map<String, dynamic> json) =
      _$CarDetailsImpl.fromJson;

  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  String get color;
  set color(String value);
  @override
  String get plateNum;
  set plateNum(String value);
  @override
  String get phoneNum;
  set phoneNum(String value);

  /// Create a copy of CarDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarDetailsImplCopyWith<_$CarDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeoModel _$GeoModelFromJson(Map<String, dynamic> json) {
  return _GeoModel.fromJson(json);
}

/// @nodoc
mixin _$GeoModel {
  @JsonKey(name: "geohash")
  String get geoHash => throw _privateConstructorUsedError;
  @JsonKey(name: "geohash")
  set geoHash(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  GeoPoint? get geoPoint => throw _privateConstructorUsedError;
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  set geoPoint(GeoPoint? value) => throw _privateConstructorUsedError;

  /// Serializes this GeoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoModelCopyWith<GeoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoModelCopyWith<$Res> {
  factory $GeoModelCopyWith(GeoModel value, $Res Function(GeoModel) then) =
      _$GeoModelCopyWithImpl<$Res, GeoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "geohash") String geoHash,
      @JsonKey(name: "geopoint") @GeoPointSerializer() GeoPoint? geoPoint});
}

/// @nodoc
class _$GeoModelCopyWithImpl<$Res, $Val extends GeoModel>
    implements $GeoModelCopyWith<$Res> {
  _$GeoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoHash = null,
    Object? geoPoint = freezed,
  }) {
    return _then(_value.copyWith(
      geoHash: null == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoModelImplCopyWith<$Res>
    implements $GeoModelCopyWith<$Res> {
  factory _$$GeoModelImplCopyWith(
          _$GeoModelImpl value, $Res Function(_$GeoModelImpl) then) =
      __$$GeoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "geohash") String geoHash,
      @JsonKey(name: "geopoint") @GeoPointSerializer() GeoPoint? geoPoint});
}

/// @nodoc
class __$$GeoModelImplCopyWithImpl<$Res>
    extends _$GeoModelCopyWithImpl<$Res, _$GeoModelImpl>
    implements _$$GeoModelImplCopyWith<$Res> {
  __$$GeoModelImplCopyWithImpl(
      _$GeoModelImpl _value, $Res Function(_$GeoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoHash = null,
    Object? geoPoint = freezed,
  }) {
    return _then(_$GeoModelImpl(
      geoHash: null == geoHash
          ? _value.geoHash
          : geoHash // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoModelImpl implements _GeoModel {
  _$GeoModelImpl(
      {@JsonKey(name: "geohash") this.geoHash = '',
      @JsonKey(name: "geopoint") @GeoPointSerializer() this.geoPoint});

  factory _$GeoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoModelImplFromJson(json);

  @override
  @JsonKey(name: "geohash")
  String geoHash;
  @override
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  GeoPoint? geoPoint;

  @override
  String toString() {
    return 'GeoModel(geoHash: $geoHash, geoPoint: $geoPoint)';
  }

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoModelImplCopyWith<_$GeoModelImpl> get copyWith =>
      __$$GeoModelImplCopyWithImpl<_$GeoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoModelImplToJson(
      this,
    );
  }
}

abstract class _GeoModel implements GeoModel {
  factory _GeoModel(
      {@JsonKey(name: "geohash") String geoHash,
      @JsonKey(name: "geopoint")
      @GeoPointSerializer()
      GeoPoint? geoPoint}) = _$GeoModelImpl;

  factory _GeoModel.fromJson(Map<String, dynamic> json) =
      _$GeoModelImpl.fromJson;

  @override
  @JsonKey(name: "geohash")
  String get geoHash;
  @JsonKey(name: "geohash")
  set geoHash(String value);
  @override
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  GeoPoint? get geoPoint;
  @JsonKey(name: "geopoint")
  @GeoPointSerializer()
  set geoPoint(GeoPoint? value);

  /// Create a copy of GeoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoModelImplCopyWith<_$GeoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PolyModel _$PolyModelFromJson(Map<String, dynamic> json) {
  return _PolyModel.fromJson(json);
}

/// @nodoc
mixin _$PolyModel {
  double get lat => throw _privateConstructorUsedError;
  set lat(double value) => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  set lng(double value) => throw _privateConstructorUsedError;

  /// Serializes this PolyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PolyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PolyModelCopyWith<PolyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolyModelCopyWith<$Res> {
  factory $PolyModelCopyWith(PolyModel value, $Res Function(PolyModel) then) =
      _$PolyModelCopyWithImpl<$Res, PolyModel>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$PolyModelCopyWithImpl<$Res, $Val extends PolyModel>
    implements $PolyModelCopyWith<$Res> {
  _$PolyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PolyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PolyModelImplCopyWith<$Res>
    implements $PolyModelCopyWith<$Res> {
  factory _$$PolyModelImplCopyWith(
          _$PolyModelImpl value, $Res Function(_$PolyModelImpl) then) =
      __$$PolyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$PolyModelImplCopyWithImpl<$Res>
    extends _$PolyModelCopyWithImpl<$Res, _$PolyModelImpl>
    implements _$$PolyModelImplCopyWith<$Res> {
  __$$PolyModelImplCopyWithImpl(
      _$PolyModelImpl _value, $Res Function(_$PolyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PolyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$PolyModelImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PolyModelImpl implements _PolyModel {
  _$PolyModelImpl({required this.lat, required this.lng});

  factory _$PolyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PolyModelImplFromJson(json);

  @override
  double lat;
  @override
  double lng;

  @override
  String toString() {
    return 'PolyModel(lat: $lat, lng: $lng)';
  }

  /// Create a copy of PolyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PolyModelImplCopyWith<_$PolyModelImpl> get copyWith =>
      __$$PolyModelImplCopyWithImpl<_$PolyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PolyModelImplToJson(
      this,
    );
  }
}

abstract class _PolyModel implements PolyModel {
  factory _PolyModel({required double lat, required double lng}) =
      _$PolyModelImpl;

  factory _PolyModel.fromJson(Map<String, dynamic> json) =
      _$PolyModelImpl.fromJson;

  @override
  double get lat;
  set lat(double value);
  @override
  double get lng;
  set lng(double value);

  /// Create a copy of PolyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PolyModelImplCopyWith<_$PolyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

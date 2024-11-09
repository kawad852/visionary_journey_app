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
  String get createdAt => throw _privateConstructorUsedError;
  set createdAt(String value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  Destination? get pickUp => throw _privateConstructorUsedError;
  set pickUp(Destination? value) => throw _privateConstructorUsedError;
  GeoModel? get arrivalGeoPoint => throw _privateConstructorUsedError;
  set arrivalGeoPoint(GeoModel? value) => throw _privateConstructorUsedError;
  Driver? get driver => throw _privateConstructorUsedError;
  set driver(Driver? value) => throw _privateConstructorUsedError;

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
      {String createdAt,
      String id,
      String status,
      Destination? pickUp,
      GeoModel? arrivalGeoPoint,
      Driver? driver});

  $DestinationCopyWith<$Res>? get pickUp;
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
    Object? createdAt = null,
    Object? id = null,
    Object? status = null,
    Object? pickUp = freezed,
    Object? arrivalGeoPoint = freezed,
    Object? driver = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pickUp: freezed == pickUp
          ? _value.pickUp
          : pickUp // ignore: cast_nullable_to_non_nullable
              as Destination?,
      arrivalGeoPoint: freezed == arrivalGeoPoint
          ? _value.arrivalGeoPoint
          : arrivalGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
    ) as $Val);
  }

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DestinationCopyWith<$Res>? get pickUp {
    if (_value.pickUp == null) {
      return null;
    }

    return $DestinationCopyWith<$Res>(_value.pickUp!, (value) {
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
      {String createdAt,
      String id,
      String status,
      Destination? pickUp,
      GeoModel? arrivalGeoPoint,
      Driver? driver});

  @override
  $DestinationCopyWith<$Res>? get pickUp;
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
    Object? createdAt = null,
    Object? id = null,
    Object? status = null,
    Object? pickUp = freezed,
    Object? arrivalGeoPoint = freezed,
    Object? driver = freezed,
  }) {
    return _then(_$OrderModelImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      pickUp: freezed == pickUp
          ? _value.pickUp
          : pickUp // ignore: cast_nullable_to_non_nullable
              as Destination?,
      arrivalGeoPoint: freezed == arrivalGeoPoint
          ? _value.arrivalGeoPoint
          : arrivalGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoModel?,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {this.createdAt = '',
      this.id = '',
      this.status = '',
      this.pickUp,
      this.arrivalGeoPoint,
      this.driver});

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @JsonKey()
  String createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String status;
  @override
  Destination? pickUp;
  @override
  GeoModel? arrivalGeoPoint;
  @override
  Driver? driver;

  @override
  String toString() {
    return 'OrderModel(createdAt: $createdAt, id: $id, status: $status, pickUp: $pickUp, arrivalGeoPoint: $arrivalGeoPoint, driver: $driver)';
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
      {String createdAt,
      String id,
      String status,
      Destination? pickUp,
      GeoModel? arrivalGeoPoint,
      Driver? driver}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get createdAt;
  set createdAt(String value);
  @override
  String get id;
  set id(String value);
  @override
  String get status;
  set status(String value);
  @override
  Destination? get pickUp;
  set pickUp(Destination? value);
  @override
  GeoModel? get arrivalGeoPoint;
  set arrivalGeoPoint(GeoModel? value);
  @override
  Driver? get driver;
  set driver(Driver? value);

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
  String get firstName => throw _privateConstructorUsedError;
  set firstName(String value) => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  set lastName(String value) => throw _privateConstructorUsedError;
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
      String firstName,
      String lastName,
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
    Object? firstName = null,
    Object? lastName = null,
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
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
      String firstName,
      String lastName,
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
    Object? firstName = null,
    Object? lastName = null,
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
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
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
      this.firstName = '',
      this.lastName = '',
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
  String firstName;
  @override
  @JsonKey()
  String lastName;
  @override
  @JsonKey()
  String photoURL;
  @override
  CarDetails? carDetails;

  @override
  String toString() {
    return 'Driver(id: $id, status: $status, currentGeoPoint: $currentGeoPoint, firstName: $firstName, lastName: $lastName, photoURL: $photoURL, carDetails: $carDetails)';
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
      String firstName,
      String lastName,
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
  String get firstName;
  set firstName(String value);
  @override
  String get lastName;
  set lastName(String value);
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
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
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
  $Res call({String name, String color, String plateNum, String phoneNum});
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
    Object? name = null,
    Object? color = null,
    Object? plateNum = null,
    Object? phoneNum = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
  $Res call({String name, String color, String plateNum, String phoneNum});
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
    Object? name = null,
    Object? color = null,
    Object? plateNum = null,
    Object? phoneNum = null,
  }) {
    return _then(_$CarDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      {this.name = '',
      this.color = '',
      this.plateNum = '',
      this.phoneNum = ''});

  factory _$CarDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarDetailsImplFromJson(json);

  @override
  @JsonKey()
  String name;
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
    return 'CarDetails(name: $name, color: $color, plateNum: $plateNum, phoneNum: $phoneNum)';
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
      {String name,
      String color,
      String plateNum,
      String phoneNum}) = _$CarDetailsImpl;

  factory _CarDetails.fromJson(Map<String, dynamic> json) =
      _$CarDetailsImpl.fromJson;

  @override
  String get name;
  set name(String value);
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

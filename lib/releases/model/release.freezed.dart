// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Release {
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReleaseCopyWith<Release> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleaseCopyWith<$Res> {
  factory $ReleaseCopyWith(Release value, $Res Function(Release) then) =
      _$ReleaseCopyWithImpl<$Res, Release>;
  @useResult
  $Res call({String name, DateTime createdAt, String description});
}

/// @nodoc
class _$ReleaseCopyWithImpl<$Res, $Val extends Release>
    implements $ReleaseCopyWith<$Res> {
  _$ReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdAt = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReleaseCopyWith<$Res> implements $ReleaseCopyWith<$Res> {
  factory _$$_ReleaseCopyWith(
          _$_Release value, $Res Function(_$_Release) then) =
      __$$_ReleaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, DateTime createdAt, String description});
}

/// @nodoc
class __$$_ReleaseCopyWithImpl<$Res>
    extends _$ReleaseCopyWithImpl<$Res, _$_Release>
    implements _$$_ReleaseCopyWith<$Res> {
  __$$_ReleaseCopyWithImpl(_$_Release _value, $Res Function(_$_Release) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdAt = null,
    Object? description = null,
  }) {
    return _then(_$_Release(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Release implements _Release {
  const _$_Release(
      {required this.name, required this.createdAt, required this.description});

  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final String description;

  @override
  String toString() {
    return 'Release(name: $name, createdAt: $createdAt, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Release &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, createdAt, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleaseCopyWith<_$_Release> get copyWith =>
      __$$_ReleaseCopyWithImpl<_$_Release>(this, _$identity);
}

abstract class _Release implements Release {
  const factory _Release(
      {required final String name,
      required final DateTime createdAt,
      required final String description}) = _$_Release;

  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ReleaseCopyWith<_$_Release> get copyWith =>
      throw _privateConstructorUsedError;
}

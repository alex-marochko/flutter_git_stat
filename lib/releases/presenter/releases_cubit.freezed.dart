// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'releases_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReleasesState {
  ReleasesStatus get status => throw _privateConstructorUsedError;
  List<ReleasedRepository> get repos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReleasesStateCopyWith<ReleasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleasesStateCopyWith<$Res> {
  factory $ReleasesStateCopyWith(
          ReleasesState value, $Res Function(ReleasesState) then) =
      _$ReleasesStateCopyWithImpl<$Res, ReleasesState>;
  @useResult
  $Res call({ReleasesStatus status, List<ReleasedRepository> repos});
}

/// @nodoc
class _$ReleasesStateCopyWithImpl<$Res, $Val extends ReleasesState>
    implements $ReleasesStateCopyWith<$Res> {
  _$ReleasesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? repos = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReleasesStatus,
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<ReleasedRepository>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReleasesStateCopyWith<$Res>
    implements $ReleasesStateCopyWith<$Res> {
  factory _$$_ReleasesStateCopyWith(
          _$_ReleasesState value, $Res Function(_$_ReleasesState) then) =
      __$$_ReleasesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReleasesStatus status, List<ReleasedRepository> repos});
}

/// @nodoc
class __$$_ReleasesStateCopyWithImpl<$Res>
    extends _$ReleasesStateCopyWithImpl<$Res, _$_ReleasesState>
    implements _$$_ReleasesStateCopyWith<$Res> {
  __$$_ReleasesStateCopyWithImpl(
      _$_ReleasesState _value, $Res Function(_$_ReleasesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? repos = null,
  }) {
    return _then(_$_ReleasesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReleasesStatus,
      repos: null == repos
          ? _value._repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<ReleasedRepository>,
    ));
  }
}

/// @nodoc

class _$_ReleasesState implements _ReleasesState {
  const _$_ReleasesState(
      {this.status = ReleasesStatus.initial,
      final List<ReleasedRepository> repos = const []})
      : _repos = repos;

  @override
  @JsonKey()
  final ReleasesStatus status;
  final List<ReleasedRepository> _repos;
  @override
  @JsonKey()
  List<ReleasedRepository> get repos {
    if (_repos is EqualUnmodifiableListView) return _repos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repos);
  }

  @override
  String toString() {
    return 'ReleasesState(status: $status, repos: $repos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleasesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._repos, _repos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_repos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleasesStateCopyWith<_$_ReleasesState> get copyWith =>
      __$$_ReleasesStateCopyWithImpl<_$_ReleasesState>(this, _$identity);
}

abstract class _ReleasesState implements ReleasesState {
  const factory _ReleasesState(
      {final ReleasesStatus status,
      final List<ReleasedRepository> repos}) = _$_ReleasesState;

  @override
  ReleasesStatus get status;
  @override
  List<ReleasedRepository> get repos;
  @override
  @JsonKey(ignore: true)
  _$$_ReleasesStateCopyWith<_$_ReleasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

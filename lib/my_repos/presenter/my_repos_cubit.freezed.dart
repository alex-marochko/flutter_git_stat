// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_repos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyReposState {
  MyReposStatus get status => throw _privateConstructorUsedError;
  List<MyRepo> get repos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyReposStateCopyWith<MyReposState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReposStateCopyWith<$Res> {
  factory $MyReposStateCopyWith(
          MyReposState value, $Res Function(MyReposState) then) =
      _$MyReposStateCopyWithImpl<$Res, MyReposState>;
  @useResult
  $Res call({MyReposStatus status, List<MyRepo> repos});
}

/// @nodoc
class _$MyReposStateCopyWithImpl<$Res, $Val extends MyReposState>
    implements $MyReposStateCopyWith<$Res> {
  _$MyReposStateCopyWithImpl(this._value, this._then);

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
              as MyReposStatus,
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<MyRepo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyReposStateCopyWith<$Res>
    implements $MyReposStateCopyWith<$Res> {
  factory _$$_MyReposStateCopyWith(
          _$_MyReposState value, $Res Function(_$_MyReposState) then) =
      __$$_MyReposStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MyReposStatus status, List<MyRepo> repos});
}

/// @nodoc
class __$$_MyReposStateCopyWithImpl<$Res>
    extends _$MyReposStateCopyWithImpl<$Res, _$_MyReposState>
    implements _$$_MyReposStateCopyWith<$Res> {
  __$$_MyReposStateCopyWithImpl(
      _$_MyReposState _value, $Res Function(_$_MyReposState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? repos = null,
  }) {
    return _then(_$_MyReposState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MyReposStatus,
      repos: null == repos
          ? _value._repos
          : repos // ignore: cast_nullable_to_non_nullable
              as List<MyRepo>,
    ));
  }
}

/// @nodoc

class _$_MyReposState implements _MyReposState {
  const _$_MyReposState(
      {this.status = MyReposStatus.initial,
      final List<MyRepo> repos = const []})
      : _repos = repos;

  @override
  @JsonKey()
  final MyReposStatus status;
  final List<MyRepo> _repos;
  @override
  @JsonKey()
  List<MyRepo> get repos {
    if (_repos is EqualUnmodifiableListView) return _repos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repos);
  }

  @override
  String toString() {
    return 'MyReposState(status: $status, repos: $repos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyReposState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._repos, _repos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_repos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyReposStateCopyWith<_$_MyReposState> get copyWith =>
      __$$_MyReposStateCopyWithImpl<_$_MyReposState>(this, _$identity);
}

abstract class _MyReposState implements MyReposState {
  const factory _MyReposState(
      {final MyReposStatus status, final List<MyRepo> repos}) = _$_MyReposState;

  @override
  MyReposStatus get status;
  @override
  List<MyRepo> get repos;
  @override
  @JsonKey(ignore: true)
  _$$_MyReposStateCopyWith<_$_MyReposState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Repo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get viewerHasStarred => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoCopyWith<Repo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoCopyWith<$Res> {
  factory $RepoCopyWith(Repo value, $Res Function(Repo) then) =
      _$RepoCopyWithImpl<$Res, Repo>;
  @useResult
  $Res call({String id, String name, bool viewerHasStarred});
}

/// @nodoc
class _$RepoCopyWithImpl<$Res, $Val extends Repo>
    implements $RepoCopyWith<$Res> {
  _$RepoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? viewerHasStarred = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      viewerHasStarred: null == viewerHasStarred
          ? _value.viewerHasStarred
          : viewerHasStarred // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoCopyWith<$Res> implements $RepoCopyWith<$Res> {
  factory _$$_RepoCopyWith(_$_Repo value, $Res Function(_$_Repo) then) =
      __$$_RepoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool viewerHasStarred});
}

/// @nodoc
class __$$_RepoCopyWithImpl<$Res> extends _$RepoCopyWithImpl<$Res, _$_Repo>
    implements _$$_RepoCopyWith<$Res> {
  __$$_RepoCopyWithImpl(_$_Repo _value, $Res Function(_$_Repo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? viewerHasStarred = null,
  }) {
    return _then(_$_Repo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      viewerHasStarred: null == viewerHasStarred
          ? _value.viewerHasStarred
          : viewerHasStarred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Repo implements _Repo {
  const _$_Repo(
      {required this.id, required this.name, required this.viewerHasStarred});

  @override
  final String id;
  @override
  final String name;
  @override
  final bool viewerHasStarred;

  @override
  String toString() {
    return 'Repo(id: $id, name: $name, viewerHasStarred: $viewerHasStarred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Repo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.viewerHasStarred, viewerHasStarred) ||
                other.viewerHasStarred == viewerHasStarred));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, viewerHasStarred);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoCopyWith<_$_Repo> get copyWith =>
      __$$_RepoCopyWithImpl<_$_Repo>(this, _$identity);
}

abstract class _Repo implements Repo {
  const factory _Repo(
      {required final String id,
      required final String name,
      required final bool viewerHasStarred}) = _$_Repo;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get viewerHasStarred;
  @override
  @JsonKey(ignore: true)
  _$$_RepoCopyWith<_$_Repo> get copyWith => throw _privateConstructorUsedError;
}

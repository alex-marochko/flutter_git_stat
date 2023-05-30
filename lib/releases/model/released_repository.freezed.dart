// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'released_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReleasedRepository {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameWithOwner => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get ownerAvatarUrl => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<Release> get releases => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReleasedRepositoryCopyWith<ReleasedRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReleasedRepositoryCopyWith<$Res> {
  factory $ReleasedRepositoryCopyWith(
          ReleasedRepository value, $Res Function(ReleasedRepository) then) =
      _$ReleasedRepositoryCopyWithImpl<$Res, ReleasedRepository>;
  @useResult
  $Res call(
      {String id,
      String name,
      String nameWithOwner,
      String? description,
      String url,
      String ownerAvatarUrl,
      int stargazersCount,
      DateTime createdAt,
      List<Release> releases});
}

/// @nodoc
class _$ReleasedRepositoryCopyWithImpl<$Res, $Val extends ReleasedRepository>
    implements $ReleasedRepositoryCopyWith<$Res> {
  _$ReleasedRepositoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameWithOwner = null,
    Object? description = freezed,
    Object? url = null,
    Object? ownerAvatarUrl = null,
    Object? stargazersCount = null,
    Object? createdAt = null,
    Object? releases = null,
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
      nameWithOwner: null == nameWithOwner
          ? _value.nameWithOwner
          : nameWithOwner // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAvatarUrl: null == ownerAvatarUrl
          ? _value.ownerAvatarUrl
          : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releases: null == releases
          ? _value.releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<Release>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReleasedRepositoryCopyWith<$Res>
    implements $ReleasedRepositoryCopyWith<$Res> {
  factory _$$_ReleasedRepositoryCopyWith(_$_ReleasedRepository value,
          $Res Function(_$_ReleasedRepository) then) =
      __$$_ReleasedRepositoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String nameWithOwner,
      String? description,
      String url,
      String ownerAvatarUrl,
      int stargazersCount,
      DateTime createdAt,
      List<Release> releases});
}

/// @nodoc
class __$$_ReleasedRepositoryCopyWithImpl<$Res>
    extends _$ReleasedRepositoryCopyWithImpl<$Res, _$_ReleasedRepository>
    implements _$$_ReleasedRepositoryCopyWith<$Res> {
  __$$_ReleasedRepositoryCopyWithImpl(
      _$_ReleasedRepository _value, $Res Function(_$_ReleasedRepository) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameWithOwner = null,
    Object? description = freezed,
    Object? url = null,
    Object? ownerAvatarUrl = null,
    Object? stargazersCount = null,
    Object? createdAt = null,
    Object? releases = null,
  }) {
    return _then(_$_ReleasedRepository(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameWithOwner: null == nameWithOwner
          ? _value.nameWithOwner
          : nameWithOwner // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      ownerAvatarUrl: null == ownerAvatarUrl
          ? _value.ownerAvatarUrl
          : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releases: null == releases
          ? _value._releases
          : releases // ignore: cast_nullable_to_non_nullable
              as List<Release>,
    ));
  }
}

/// @nodoc

class _$_ReleasedRepository implements _ReleasedRepository {
  const _$_ReleasedRepository(
      {required this.id,
      required this.name,
      required this.nameWithOwner,
      this.description,
      required this.url,
      required this.ownerAvatarUrl,
      required this.stargazersCount,
      required this.createdAt,
      required final List<Release> releases})
      : _releases = releases;

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameWithOwner;
  @override
  final String? description;
  @override
  final String url;
  @override
  final String ownerAvatarUrl;
  @override
  final int stargazersCount;
  @override
  final DateTime createdAt;
  final List<Release> _releases;
  @override
  List<Release> get releases {
    if (_releases is EqualUnmodifiableListView) return _releases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releases);
  }

  @override
  String toString() {
    return 'ReleasedRepository(id: $id, name: $name, nameWithOwner: $nameWithOwner, description: $description, url: $url, ownerAvatarUrl: $ownerAvatarUrl, stargazersCount: $stargazersCount, createdAt: $createdAt, releases: $releases)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReleasedRepository &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameWithOwner, nameWithOwner) ||
                other.nameWithOwner == nameWithOwner) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.ownerAvatarUrl, ownerAvatarUrl) ||
                other.ownerAvatarUrl == ownerAvatarUrl) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._releases, _releases));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nameWithOwner,
      description,
      url,
      ownerAvatarUrl,
      stargazersCount,
      createdAt,
      const DeepCollectionEquality().hash(_releases));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReleasedRepositoryCopyWith<_$_ReleasedRepository> get copyWith =>
      __$$_ReleasedRepositoryCopyWithImpl<_$_ReleasedRepository>(
          this, _$identity);
}

abstract class _ReleasedRepository implements ReleasedRepository {
  const factory _ReleasedRepository(
      {required final String id,
      required final String name,
      required final String nameWithOwner,
      final String? description,
      required final String url,
      required final String ownerAvatarUrl,
      required final int stargazersCount,
      required final DateTime createdAt,
      required final List<Release> releases}) = _$_ReleasedRepository;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nameWithOwner;
  @override
  String? get description;
  @override
  String get url;
  @override
  String get ownerAvatarUrl;
  @override
  int get stargazersCount;
  @override
  DateTime get createdAt;
  @override
  List<Release> get releases;
  @override
  @JsonKey(ignore: true)
  _$$_ReleasedRepositoryCopyWith<_$_ReleasedRepository> get copyWith =>
      throw _privateConstructorUsedError;
}

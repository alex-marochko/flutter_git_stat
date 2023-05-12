// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoDto _$RepoDtoFromJson(Map<String, dynamic> json) => RepoDto(
      id: json['id'] as String,
      name: json['name'] as String,
      viewerHasStarred: json['viewerHasStarred'] as bool,
    );

Map<String, dynamic> _$RepoDtoToJson(RepoDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'viewerHasStarred': instance.viewerHasStarred,
    };

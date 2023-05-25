// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRepoDto _$MyRepoDtoFromJson(Map<String, dynamic> json) => MyRepoDto(
      id: json['id'] as String,
      name: json['name'] as String,
      viewerHasStarred: json['viewerHasStarred'] as bool,
    );

Map<String, dynamic> _$MyRepoDtoToJson(MyRepoDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'viewerHasStarred': instance.viewerHasStarred,
    };

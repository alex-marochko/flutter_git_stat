/*
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_dto.g.dart';

@JsonSerializable(createPerFieldToJson: false)
class ReleaseDto {
  final String name;
  final DateTime createdAt;
  final String description;

  ReleaseDto({
    required this.name,
    required this.createdAt,
    required this.description,
  });

  factory ReleaseDto.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDtoFromJson(json);
}
*/

import 'package:equatable/equatable.dart';
import 'package:git_stat/releases/model/release.dart';

class ReleaseDto extends Equatable {
  final String name;
  final DateTime createdAt;
  final String description;

  const ReleaseDto(
      {required this.name, required this.createdAt, required this.description});

  factory ReleaseDto.fromJson(Map<String, dynamic> json) {
    return ReleaseDto(
      name: json['node']['name'],
      createdAt: DateTime.parse(json['node']['createdAt']),
      description: json['node']['description'],
    );
  }

  @override
  List<Object> get props => [name, createdAt, description];

  Release toModel() => Release(
        name: name,
        createdAt: createdAt,
        description: description,
      );
}

/*
import 'package:json_annotation/json_annotation.dart';

part 'released_repository_dto.g.dart';

@JsonSerializable(createPerFieldToJson: false)
class ReleasedRepositoryDto {
  final String id;
  final String name;
  final String description;
  final String url;
  final int stargazersCount;
  final List<ReleaseDto> releases;

  ReleasedRepositoryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.stargazersCount,
    required this.releases,
  });

  factory ReleasedRepositoryDto.fromJson(Map<String, dynamic> json) =>
      _$ReleasedRepositoryDtoFromJson(json);
}
*/

import 'package:equatable/equatable.dart';
import 'package:git_stat/releases/model/released_repository.dart';
import 'package:git_stat/releases/source/release_dto.dart';

class ReleasedRepositoryDto extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String url;
  final int stargazersCount;
  final List<ReleaseDto> releases;

  const ReleasedRepositoryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.stargazersCount,
    required this.releases,
  });

  factory ReleasedRepositoryDto.fromJson(Map<String, dynamic> json) {
    List<dynamic> releaseEdges = json['node']['releases']['edges'];
    List<ReleaseDto> releases =
        releaseEdges.map((edge) => ReleaseDto.fromJson(edge)).toList();

    return ReleasedRepositoryDto(
      id: json['node']['id'],
      name: json['node']['name'],
      description: json['node']['description'],
      url: json['node']['url'],
      stargazersCount: json['node']['stargazers']['totalCount'],
      releases: releases,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        url,
        stargazersCount,
        releases,
      ];

  ReleasedRepository toModel() => ReleasedRepository(
        id: id,
        name: name,
        description: description,
        url: url,
        stargazersCount: stargazersCount,
        releases: releases.map((e) => e.toModel()).toList(),
      );
}

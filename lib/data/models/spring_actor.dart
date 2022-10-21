import 'package:json_annotation/json_annotation.dart';

part 'spring_actor.g.dart';

@JsonSerializable()
class SpringActor {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'actorMdbId')
  final String actorMdbId;
  @JsonKey(name: 'profilePath', defaultValue: "")
  final String profilePath;

  SpringActor({required this.id, required this.name, required this.actorMdbId, required this.profilePath});

  factory SpringActor.fromJson(Map<String, dynamic> json) =>
      _$SpringActorFromJson(json);

  Map<String, dynamic> toJson() => _$SpringActorToJson(this);
}


import 'package:json_annotation/json_annotation.dart';
part 'mdb_actor.g.dart';

@JsonSerializable()
class MDBActor {
  final int id;
  final String character;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final int gender;
  @JsonKey(name: 'cast_id')
  final int castId;
  final String name;
  final int order;
  @JsonKey(name: 'profile_path')
  final String profilePath;

  MDBActor({required this.castId,
    required this.character,
    required this.creditId,
    required this.gender,
    required this.id,
    required this.name,
    required this.order,
    required this.profilePath,
  });

  factory MDBActor.fromJson(Map<String, dynamic> json) => _$MDBActorFromJson(json);

  Map<String, dynamic> toJson() => _$MDBActorToJson(this);
}

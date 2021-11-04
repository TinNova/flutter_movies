import 'package:json_annotation/json_annotation.dart';
import 'package:movies/data/models/mdb_actor.dart';

import 'mdb_crew.dart';
part 'mdb_credits.g.dart';

@JsonSerializable(explicitToJson: true) //This means MDBActors depends on a nested class
class MDBCredits {

  @JsonKey(name: 'cast')
  final List<MDBActor> actors;
  @JsonKey(name: 'crew')
  final List<MDBCrew> crew;
  MDBCredits({required this.actors, required this.crew});

  factory MDBCredits.fromJson(Map<String, dynamic> json) => _$MDBCreditsFromJson(json);
  Map<String, dynamic> toJson() => _$MDBCreditsToJson(this);

}

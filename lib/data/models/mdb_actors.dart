import 'package:json_annotation/json_annotation.dart';
import 'package:movies/data/models/mdb_actor.dart';
part 'mdb_actors.g.dart';

@JsonSerializable(explicitToJson: true) //This means MDBActors depends on a nested class
class MDBActors {

  @JsonKey(name: 'cast')
  final List<MDBActor> actors;
  // final List<MDBCrew> crews;
  MDBActors({required this.actors});

  factory MDBActors.fromJson(Map<String, dynamic> json) => _$MDBActorsFromJson(json);
  Map<String, dynamic> toJson() => _$MDBActorsToJson(this);

}

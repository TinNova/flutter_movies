import 'package:json_annotation/json_annotation.dart';
part 'mdb_crew.g.dart';

@JsonSerializable()
class MDBCrew {
  final int id;
  @JsonKey(name: 'known_for_department')
  final String department;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  @JsonKey(name: 'profile_path', defaultValue: "")
  final String profilePath;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String job;


  MDBCrew({
    required this.id,
    required this.department,
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.creditId,
    required this.job,
  });

  factory MDBCrew.fromJson(Map<String, dynamic> json) => _$MDBCrewFromJson(json);

  Map<String, dynamic> toJson() => _$MDBCrewToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'mdb_author_details.g.dart';

@JsonSerializable()
class MDBAuthorDetails {
  String name;
  String username;
  @JsonKey(name: 'avatar_path', defaultValue: '')
  String profilePath;
  @JsonKey(defaultValue: 0.0)
  double rating;

  MDBAuthorDetails(
      {required this.name,
        required this.username,
        required this.profilePath,
        required this.rating});

  factory MDBAuthorDetails.fromJson(Map<String, dynamic> json) => _$MDBAuthorDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MDBAuthorDetailsToJson(this);
}

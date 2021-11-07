import 'package:json_annotation/json_annotation.dart';
part 'mdb_genre.g.dart';

@JsonSerializable()
class MDBGenre {
  final int id;
  final String name;

  MDBGenre({required this.id, required this.name});

  factory MDBGenre.fromJson(Map<String, dynamic> json) => _$MDBGenreFromJson(json);

  Map<String, dynamic> toJson() => _$MDBGenreToJson(this);
}

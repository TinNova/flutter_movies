import 'package:json_annotation/json_annotation.dart';

part 'mdb_trailer.g.dart';

@JsonSerializable()
class MDBTrailer {
  final String id;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  MDBTrailer({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  factory MDBTrailer.fromJson(Map<String, dynamic> json) => _$MDBTrailerFromJson(json);

  Map<String, dynamic> toJson() => _$MDBTrailerToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'mdb_trailer.dart';

part 'mdb_trailers.g.dart';

@JsonSerializable(explicitToJson: true) //This means MDBTrailer depends on a nested class
class MDBTrailers {

  @JsonKey(name: 'results')
  final List<MDBTrailer> trailers;
  MDBTrailers({required this.trailers});

  factory MDBTrailers.fromJson(Map<String, dynamic> json) => _$MDBTrailersFromJson(json);

  Map<String, dynamic> toJson() => _$MDBTrailersToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'mdb_review.g.dart';

@JsonSerializable()
class MDBReview {
  String author = "";
  String content = "";
  String id = "";
  String url = "";

  MDBReview({required this.author, required this.content, required this.id, required this.url});

  factory MDBReview.fromJson(Map<String, dynamic> json) => _$MDBReviewFromJson(json);

  Map<String, dynamic> toJson() => _$MDBReviewToJson(this);

}

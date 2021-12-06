import 'package:json_annotation/json_annotation.dart';

import 'mdb_author_details.dart';

part 'mdb_review.g.dart';

@JsonSerializable()
class MDBReview {
  String id;
  String author;
  @JsonKey(name: 'author_details')
  MDBAuthorDetails authorDetails;
  @JsonKey(name: 'created_at')
  String createdAt;
  String content;
  String url;

  MDBReview(
      {required this.id,
      required this.author,
      required this.authorDetails,
      required this.createdAt,
      required this.content,
      required this.url});

  factory MDBReview.fromJson(Map<String, dynamic> json) => _$MDBReviewFromJson(json);

  Map<String, dynamic> toJson() => _$MDBReviewToJson(this);
}

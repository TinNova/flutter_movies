import 'package:json_annotation/json_annotation.dart';

import 'mdb_review.dart';
part 'mdb_reviews.g.dart';


@JsonSerializable(explicitToJson: true) //This means MDBReviews depends on a nested class
class MDBReviews {
  // int id = 0;
  // int page = 0;
  final List<MDBReview> reviews;
  // int totalPages = 0;
  // int totalResults = 0;

  MDBReviews({required this.reviews});

  factory MDBReviews.fromJson(Map<String, dynamic> json) => _$MDBReviewsFromJson(json);

  Map<String, dynamic> toJson() => _$MDBReviewsToJson(this);
}

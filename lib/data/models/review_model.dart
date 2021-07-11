class MovieReviewModel {
  int id = 0;
  int page = 0;
  List<MDBReview> reviews = List.empty();
  int totalPages = 0;
  int totalResults = 0;

  MovieReviewModel(
      {required this.id,
      required this.page,
      required this.reviews,
      required this.totalPages,
      required this.totalResults});

  MovieReviewModel.map(dynamic obj) {
    id = obj["id"];
    page = obj["page"];
    if (obj["results"] != null) {
      reviews = [];
      obj["results"].forEach((v) {
        reviews.add(MDBReview.map(v));
      });
    }
    totalPages = obj["totalPages"];
    totalResults = obj["totalResults"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["page"] = page;
    if (reviews != null) {
      map["results"] = reviews.map((v) => v.toMap()).toList();
    }
    map["totalPages"] = totalPages;
    map["totalResults"] = totalResults;
    return map;
  }
}

class MDBReview {
  String author = "";
  String content = "";
  String id = "";
  String url = "";

  MDBReview({required this.author, required this.content, required this.id, required this.url});

  MDBReview.map(dynamic obj) {
    author = obj["author"];
    content = obj["content"];
    id = obj["id"];
    url = obj["url"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["author"] = author;
    map["content"] = content;
    map["id"] = id;
    map["url"] = url;
    return map;
  }
}

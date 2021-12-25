class Movie {
  int id = 0;
  String title = "";
  String posterPath = "";
  String backdropPath = "";
  bool isFavourite = false;

  Movie({required int id, required String title, required String posterPath, required String backdropPath, bool isFavourite = false}) {
    this.id = id;
    this.title = title;
    this.posterPath = posterPath;
    this.backdropPath = backdropPath;
    this.isFavourite = isFavourite;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'posterPath': posterPath,
    };
  }
}

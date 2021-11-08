class Movie {
  int id = 0;
  String title = "";
  String posterPath = "";
  String backdropPath = "";

  Movie({required int id, required String title, required String posterPath, required String backdropPath}) {
    this.id = id;
    this.title = title;
    this.posterPath = posterPath;
    this.backdropPath = backdropPath;
  }
}

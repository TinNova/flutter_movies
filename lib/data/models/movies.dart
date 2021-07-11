class MDBMovies {
  int _page = 0;
  List<MDBMovie> _results = List.empty();
  int _totalResults = 0;
  int _totalPages = 0;

  MDBMovies({page, results, totalResults, totalPages}) {
    this._page = page;
    this._results = results;
    this._totalResults = totalResults;
    this._totalPages = totalPages;
  }

  List<MDBMovie> get results => _results;

  MDBMovies.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = <MDBMovie>[];
      json['results'].forEach((v) {
        _results.add(new MDBMovie.fromJson(v));
      });
    }
    _totalResults = json['total_results'];
    _totalPages = json['total_pages'];
  }
}

class MDBMovie {
  String? _posterPath;
  bool? _adult;
  String? _overview;
  String? _releaseDate;
  List<int>? _genreIds;
  int? _id;
  String? _originalTitle;
  String? _originalLanguage;
  String? _title;
  String? _backdropPath;
  double? _popularity;
  int? _voteCount;
  bool? _video;

  MDBMovie(
      {posterPath,
      adult,
      overview,
      releaseDate,
      genreIds,
      id,
      originalTitle,
      originalLanguage,
      title,
      backdropPath,
      popularity,
      voteCount,
      video});

  MDBMovie.fromJson(Map<String, dynamic> json) {
    _posterPath = json['poster_path'];
    _adult = json['adult'];
    _overview = json['overview'];
    _releaseDate = json['release_date'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _originalTitle = json['original_title'];
    _originalLanguage = json['original_language'];
    _title = json['title'];
    _backdropPath = json['backdrop_path'];
    _popularity = json['popularity'];
    _voteCount = json['vote_count'];
    _video = json['video'];
  }

  bool get video => _video ?? false;

  int get voteCount => _voteCount ?? 0;

  double get popularity => _popularity ?? 0.0;

  String get backdropPath => _backdropPath ?? "";

  String get title => _title ?? "";

  String get originalLanguage => _originalLanguage ?? "";

  String get originalTitle => _originalTitle ?? "";

  int get id => _id ?? 0;

  List<int> get genreIds => _genreIds ?? List.empty();

  String get releaseDate => _releaseDate ?? "";

  String get overview => _overview ?? "";

  bool get adult => _adult ?? false;

  String get posterPath => _posterPath ?? "";
}

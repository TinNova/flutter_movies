import 'package:flutter/material.dart';

class MDBDetailModel {
  bool? _adult;
  String? _backdropPath;
  dynamic? _belongsToCollection;
  int? _budget;
  List<MDBGenres>? _genres;
  String? _homepage;
  int? _id;
  String? _imdbId;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  List<MDBProduction_companies>? _productionCompanies;
  List<MDBProduction_countries>? _productionCountries;
  String? _releaseDate;
  int? _revenue;
  int? _runtime;
  List<MDBSpoken_languages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _title;
  bool? _video;
  double? _voteAverage;
  int? _voteCount;

  MDBDetailModel(
      {adult,
      backdropPath,
      belongsToCollection,
      budget,
      genres,
      homepage,
      id,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      productionCompanies,
      productionCountries,
      releaseDate,
      revenue,
      runtime,
      spokenLanguages,
      status,
      tagline,
      title,
      video,
      voteAverage,
      voteCount}) {
    this._adult = adult;
    this._backdropPath = backdropPath;
    this._belongsToCollection = belongsToCollection;
    this._budget = budget;
    this._genres = genres;
    this._homepage = homepage;
    this._id = id;
    this._imdbId = imdbId;
    this._originalLanguage = originalLanguage;
    this._originalTitle = originalTitle;
    this._overview = overview;
    this._popularity = popularity;
    this._posterPath = posterPath;
    this._productionCompanies = productionCompanies;
    this._productionCountries = productionCountries;
    this._releaseDate = releaseDate;
    this._revenue = revenue;
    this._runtime = runtime;
    this._spokenLanguages = spokenLanguages;
    this._status = status;
    this._tagline = tagline;
    this._title = title;
    this._video = video;
    this._voteAverage = voteAverage;
  }

  bool get adult => _adult ?? false;

  String get backdropPath => _backdropPath ?? "";

  String get belongsToCollection => _belongsToCollection ?? "";

  int get budget => _budget ?? 0;

  List<MDBGenres> get genres => _genres ?? List.empty();

  String get homepage => _homepage ?? "";

  int get id => _id ?? 0;

  String get imdbId => _imdbId ?? "";

  String get originalLanguage => _originalLanguage ?? "";

  String get originalTitle => _originalTitle ?? "";

  String get overview => _overview ?? "";

  double get popularity => _popularity ?? 0.0;

  String get posterPath => _posterPath ?? "";

  List<MDBProduction_companies> get productionCompanies => _productionCompanies ?? List.empty();

  List<MDBProduction_countries> get productionCountries => _productionCountries ?? List.empty();

  String get releaseDate => _releaseDate ?? "";

  int get revenue => _revenue ?? 0;

  int get runtime => _runtime ?? 0;

  List<MDBSpoken_languages> get spokenLanguages => _spokenLanguages ?? List.empty();

  String get status => _status ?? "";

  String get tagline => _tagline ?? "";

  String get title => _title ?? "";

  bool get video => _video ?? false;

  double get voteAverage => _voteAverage ?? 0.0;

  int get voteCount => _voteCount ?? 0;

  MDBDetailModel.map(dynamic obj) {
    _adult = obj["adult"];
    _backdropPath = obj["backdropPath"];
    _belongsToCollection = obj["belongsToCollection"];
    _budget = obj["budget"];
    if (obj["genres"] != null) {
      _genres = [];
      obj["genres"].forEach((v) {
        _genres!.add(MDBGenres.map(v));
      });
    }
    _homepage = obj["homepage"];
    _id = obj["id"];
    _imdbId = obj["imdbId"];
    _originalLanguage = obj["originalLanguage"];
    _originalTitle = obj["originalTitle"];
    _overview = obj["overview"];
    _popularity = obj["popularity"];
    _posterPath = obj["posterPath"];
    if (obj["productionCompanies"] != null) {
      _productionCompanies = [];
      obj["productionCompanies"].forEach((v) {
        _productionCompanies!.add(MDBProduction_companies.map(v));
      });
    }
    if (obj["productionCountries"] != null) {
      _productionCountries = [];
      obj["productionCountries"].forEach((v) {
        _productionCountries!.add(MDBProduction_countries.map(v));
      });
    }
    _releaseDate = obj["releaseDate"];
    _revenue = obj["revenue"];
    _runtime = obj["runtime"];
    if (obj["spokenLanguages"] != null) {
      _spokenLanguages = [];
      obj["spokenLanguages"].forEach((v) {
        _spokenLanguages!.add(MDBSpoken_languages.map(v));
      });
    }
    _status = obj["status"];
    _tagline = obj["tagline"];
    _title = obj["title"];
    _video = obj["video"];
    _voteAverage = obj["voteAverage"];
    _voteCount = obj["voteCount"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["adult"] = _adult;
    map["backdropPath"] = _backdropPath;
    map["belongsToCollection"] = _belongsToCollection;
    map["budget"] = _budget;
    if (_genres != null) {
      map["genres"] = _genres!.map((v) => v.toMap()).toList();
    }
    map["homepage"] = _homepage;
    map["id"] = _id;
    map["imdbId"] = _imdbId;
    map["originalLanguage"] = _originalLanguage;
    map["originalTitle"] = _originalTitle;
    map["overview"] = _overview;
    map["popularity"] = _popularity;
    map["posterPath"] = _posterPath;
    if (_productionCompanies != null) {
      map["productionCompanies"] = _productionCompanies!.map((v) => v.toMap()).toList();
    }
    if (_productionCountries != null) {
      map["productionCountries"] = _productionCountries!.map((v) => v.toMap()).toList();
    }
    map["releaseDate"] = _releaseDate;
    map["revenue"] = _revenue;
    map["runtime"] = _runtime;
    if (_spokenLanguages != null) {
      map["spokenLanguages"] = _spokenLanguages!.map((v) => v.toMap()).toList();
    }
    map["status"] = _status;
    map["tagline"] = _tagline;
    map["title"] = _title;
    map["video"] = _video;
    map["voteAverage"] = _voteAverage;
    map["voteCount"] = _voteCount;
    return map;
  }
}

class MDBSpoken_languages {
  String iso6391 = "";
  String name = "";

  MDBSpoken_languages({required this.iso6391, required this.name});

  MDBSpoken_languages.map(dynamic obj) {
    iso6391 = obj["iso6391"];
    name = obj["name"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["iso6391"] = iso6391;
    map["name"] = name;
    return map;
  }
}

class MDBProduction_countries {
  String iso31661 = "";
  String name = "";

  MDBProduction_countries({required this.iso31661, required this.name});

  MDBProduction_countries.map(dynamic obj) {
    iso31661 = obj["iso31661"];
    name = obj["name"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["iso31661"] = iso31661;
    map["name"] = name;
    return map;
  }
}

class MDBProduction_companies {
  int id = 0;
  String logoPath = "";
  String name = "";
  String originCountry = "";

  MDBProduction_companies({required this.id, required this.logoPath, required this.name, required this.originCountry});

  MDBProduction_companies.map(dynamic obj) {
    id = obj["id"];
    logoPath = obj["logoPath"];
    name = obj["name"];
    originCountry = obj["originCountry"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["logoPath"] = logoPath;
    map["name"] = name;
    map["originCountry"] = originCountry;
    return map;
  }
}

class MDBGenres {
  int id = 0;
  String name = "";

  MDBGenres({required this.id, required this.name});

  MDBGenres.map(dynamic obj) {
    id = obj["id"];
    name = obj["name"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}

import '../consts.dart';

class MovieTrailer {
  int _id;
  List<Trailer> _results;

  int get id => _id;
  List<Trailer> get results => _results;

  MovieTrailer({int id, List<Trailer> results}) {
    _id = id;
    _results = results;
  }

  MovieTrailer.map(dynamic obj) {
    _id = obj["id"];
    if (obj["results"] != null) {
      _results = [];
      obj["results"].forEach((v) {
        _results.add(Trailer.map(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    if (_results != null) {
      map["results"] = _results.map((v) => v.toMap()).toList();
    }
    return map;
  }
}

class Trailer {
  String _id;
  String _key;
  String _name;
  String _site;
  int _size;
  String _type;

  String get id => _id;
  String get key => _key;
  String get thumbnail => YOUTUBE_THUMBNAIL_START_URL + _key + YOUTUBE_THUMBNAIL_END_URL;
  String get trailerUrl => YOUTUBE_TRAILER_BASE_URL + _key;
  String get name => _name;
  String get site => _site;
  int get size => _size;
  String get type => _type;

  Trailer({String id, String key, String name, String site, int size, String type}) {
    _id = id;
    _key = key;
    _name = name;
    _site = site;
    _size = size;
    _type = type;
  }

  Trailer.map(dynamic obj) {
    _id = obj["id"];
    _key = obj["key"];
    _name = obj["name"];
    _site = obj["site"];
    _size = obj["size"];
    _type = obj["type"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["key"] = _key;
    map["name"] = _name;
    map["site"] = _site;
    map["size"] = _size;
    map["type"] = _type;
    return map;
  }
}

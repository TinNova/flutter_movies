import '../../consts.dart';

class MDBMovieTrailers {
  int _id = 0;
  List<MDBTrailer> _results = List.empty();

  int get id => _id;
  List<MDBTrailer> get results => _results;

  MDBMovieTrailers({required int id, required List<MDBTrailer> results}) {
    _id = id;
    _results = results;
  }

  MDBMovieTrailers.map(dynamic obj) {
    _id = obj["id"];
    if (obj["results"] != null) {
      _results = [];
      obj["results"].forEach((v) {
        _results.add(MDBTrailer.map(v));
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

class MDBTrailer {
  String _id = "";
  String _key = "";
  String _thumbnail = "";
  String _trailerUrl = "";
  String _name = "";
  String _site = "";
  int _size = 0;
  String _type = "";

  String get id => _id;
  String get key => _key;
  String get thumbnail => "random"; //_thumbnail;
  String get trailerUrl => _trailerUrl;
  String get name => _name;
  String get site => _site;
  int get size => _size;
  String get type => _type;

  MDBTrailer(
      {required String id,
      required String key,
      required String thumbnail,
      required String trailerUrl,
      required String name,
      required String site,
      required int size,
      required String type}) {
    _id = id;
    _key = key;
    _thumbnail = thumbnail;
    _trailerUrl = trailerUrl;
    _name = name;
    _site = site;
    _size = size;
    _type = type;
  }

  MDBTrailer.map(dynamic obj) {
    _id = obj["id"];
    _key = obj["key"];
    _thumbnail = obj["thumbnail"];
    _trailerUrl = obj["trailerUrl"];
    _name = obj["name"];
    _site = obj["site"];
    _size = obj["size"];
    _type = obj["type"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["key"] = _key;
    map["thumbnail"] = _thumbnail;
    map["trailerUrl"] = _trailerUrl;
    map["name"] = _name;
    map["site"] = _site;
    map["size"] = _size;
    map["type"] = _type;
    return map;
  }
}

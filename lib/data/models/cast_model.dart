class MovieCast {
  int id = 0;
  List<MDBCast> cast = List.empty();
  List<Crew> crew = List.empty();

  MovieCast({required this.id, required this.cast, required this.crew});

  MovieCast.map(dynamic obj) {
    id = obj["id"];
    if (obj["cast"] != null) {
      cast = [];
      obj["cast"].forEach((v) {
        cast.add(MDBCast.map(v));
      });
    }
    if (obj["crew"] != null) {
      crew = [];
      obj["crew"].forEach((v) {
        crew.add(Crew.map(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["cast"] = cast.map((v) => v.toMap()).toList();
    map["crew"] = crew.map((v) => v.toMap()).toList();
    return map;
  }
}

class Crew {
  String creditId = "";
  String department = "";
  int gender = 0;
  int id = 0;
  String job = "";
  String name = "";
  dynamic profilePath;

  Crew(
      {required this.creditId,
      required this.department,
      required this.gender,
      required this.id,
      required this.job,
      required this.name,
      this.profilePath});

  Crew.map(dynamic obj) {
    creditId = obj["creditId"];
    department = obj["department"];
    gender = obj["gender"];
    id = obj["id"];
    job = obj["job"];
    name = obj["name"];
    profilePath = obj["profilePath"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["creditId"] = creditId;
    map["department"] = department;
    map["gender"] = gender;
    map["id"] = id;
    map["job"] = job;
    map["name"] = name;
    map["profilePath"] = profilePath;
    return map;
  }
}

class MDBCast {
  int castId = 0;
  String character = "";
  String creditId = "";
  int gender = 0;
  int id = 0;
  String name = "";
  int order = 0;
  String profilePath = "";

  MDBCast(
      {required this.castId,
      required this.character,
      required this.creditId,
      required this.gender,
      required this.id,
      required this.name,
      required this.order,
      required this.profilePath});

  MDBCast.map(dynamic obj) {
    castId = obj["castId"];
    character = obj["character"];
    creditId = obj["creditId"];
    gender = obj["gender"];
    id = obj["id"];
    name = obj["name"];
    order = obj["order"];
    profilePath = obj["profilePath"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["castId"] = castId;
    map["character"] = character;
    map["creditId"] = creditId;
    map["gender"] = gender;
    map["id"] = id;
    map["name"] = name;
    map["order"] = order;
    map["profilePath"] = profilePath;
    return map;
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'spring_movie_saved.g.dart';

@JsonSerializable()
class SpringMovieSaved {
  @JsonKey(name: 'saved')
  final String saved;

  SpringMovieSaved({required this.saved});

  factory SpringMovieSaved.fromJson(Map<String, dynamic> json) =>
      _$SpringMovieSavedFromJson(json);

  Map<String, dynamic> toJson() => _$SpringMovieSavedToJson(this);

}

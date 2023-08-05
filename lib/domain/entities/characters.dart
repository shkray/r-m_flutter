import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';

part 'characters.g.dart';

@JsonSerializable(explicitToJson: true)
class Result{
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Map<String, String> origin;
  Map<String, String> location;
  String image;
  List<String> episode;
  String url;
  String created;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Characters{
  Info info;
  List<Result> results;

  Characters({
    required this.info,
    required this.results
  });

  factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersToJson(this);
}
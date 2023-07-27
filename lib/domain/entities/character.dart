import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Info{

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

  Character({
    required super.count,
    required super.pages,
    required super.next,
    required super.prev,
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
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
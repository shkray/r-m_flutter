import 'package:rick_and_morty_api/rick_and_morty_api.dart';

class CharacterController{
  final characterService = CharacterService();

  Future<List<Character>> allCharacters() async {
    final characters = await characterService.getAllCharacters();
    // for (var character in characters){
    //   print("${character.name}, ${character.location.name}");
    // }
    return characters;
  }

  Future<List<Character>> findCharactersByName({required String name}) async{
    final characters = await characterService.getFilteredCharacters(
        CharacterFilters(name: name)
    );
    return characters;
  }
}
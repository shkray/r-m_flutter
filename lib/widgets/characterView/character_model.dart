import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty_app/domain/services/characters_service.dart';

import '../../domain/entities/character.dart';

class _ViewModelState {
  List<Character> characters;
  _ViewModelState({required this.characters});
}

class ViewModel extends ChangeNotifier{
  final _characterService = CharactersService();
  final state = _ViewModelState(characters: []);

  void allCharacters() async{
    state.characters = List.from(await _characterService.getAllCharacters());
    notifyListeners();
  }

  ViewModel() {
    allCharacters();
  }
}
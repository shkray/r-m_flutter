import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';
import 'package:rick_and_morty_app/domain/services/characters_service.dart';
import '/domain/entities/characters.dart' as chr;

class ViewModel extends ChangeNotifier{
  final _characterService = CharactersService();
  bool _isOnline = false;
  late int _itemCount;
  final _scrollController = ScrollController();
  late chr.Characters characters;

  ScrollController get scrollController => _scrollController;
  int get itemCount => _itemCount;
  bool get status => _isOnline;

  void getAllCharacters() async{
    characters = await _characterService.getAllCharacters();
    _itemCount = characters.results.length;
    _isOnline = true;
    notifyListeners();
  }

  void _nextPage() async{
    final tempCharacters = await _characterService.nextPage(characters);
    //print('current: ${characters.results.length}, new: ${tempCharacters.results.length}');
    characters.results.addAll(tempCharacters.results);
    characters.info = tempCharacters.info;
    _itemCount = characters.results.length;
    notifyListeners();
  }

  void _scrollListener(){
    //print('current position: ${_scrollController.position.pixels}, max position: ${_scrollController.position.maxScrollExtent}');
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent &&
        characters.info.next != null){
      _nextPage();
    }
  }

  ViewModel() {
    getAllCharacters();
    _scrollController.addListener(_scrollListener);
  }
}
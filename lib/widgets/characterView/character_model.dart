import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/entities/info.dart';
import 'package:rick_and_morty_app/domain/services/characters_service.dart';
import '/domain/entities/characters.dart' as chr;

class ViewModel extends ChangeNotifier{
  final _characterService = CharactersService();
  bool _isOnline = false;
  late int _itemCount;
  final _scrollController = ScrollController();
  get scrollController => _scrollController;
  get itemCount => _itemCount;
  get status => _isOnline;
  late chr.Characters characters;

  void getAllCharacters() async{
    characters = await _characterService.getAllCharacters();
    _itemCount = characters.results.length;
    _isOnline = true;
    notifyListeners();
  }

  void _nextPage() async{
    final tempCharacters = await _characterService.nextPage(characters);
    characters.results.addAll(tempCharacters.results);
    characters.info = tempCharacters.info;
    _itemCount = characters.results.length;
    notifyListeners();
  }

  void _scrollListener(){
    //print('current position: ${_scrollController.position.pixels}, max position: ${_scrollController.position.maxScrollExtent}');
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent-1000 &&
        characters.info.next != null){
      _nextPage();
    }
  }

  ViewModel() {
    getAllCharacters();
    _scrollController.addListener(_scrollListener);
  }
}
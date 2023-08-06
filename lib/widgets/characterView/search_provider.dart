import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier{
  bool _showSearch = false;
  bool get showSearch => _showSearch;

  void changeState(){
    _showSearch = !showSearch;
    //print('in provider: $showSearch');
    notifyListeners();
  }
}
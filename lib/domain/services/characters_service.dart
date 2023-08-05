import 'dart:convert';
import 'dart:io';

import '../entities/characters.dart';
// TODO: save data and load instead of loading it from internet



class CharactersService{
  final client = HttpClient();

  Future<Characters> getAllCharacters() async{
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    final request = await client.getUrl(url);
    final response = await request.close();
    final stringsList = await response.transform(utf8.decoder).toList();
    final jsonString = stringsList.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final result = Characters.fromJson(json);
    return result;
  }

  Future<Characters> nextPage(Characters characters) async{
    final url = Uri.parse(characters.info.next);
    final request = await client.getUrl(url);
    final response = await request.close();
    final stringsList = await response.transform(utf8.decoder).toList();
    final jsonString = stringsList.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final result = Characters.fromJson(json);
    return result;
  }
}
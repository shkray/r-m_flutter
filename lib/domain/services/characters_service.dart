import 'dart:convert';
import 'dart:io';

import '../entities/character.dart';
// TODO: save data and load instead of loading it from internet

class CharactersService{
  final client = HttpClient();
  
  getAllCharacters() async{
    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    final request = await client.getUrl(url);
    final responce = await request.close();
    final json = await responce
      .transform(utf8.decoder)
      .toList()
      .then((value) => value.join())
      .then((v) => jsonDecode(v) as List<dynamic>);
    final result = json
      .map((dynamic e) => Character.fromJson(e as Map<String, dynamic>))
      .toList();
    return result;
  }
}
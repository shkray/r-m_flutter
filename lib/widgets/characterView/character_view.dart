import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'character_widget.dart';
import 'character_model.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => ViewModel(),
      child: const CharacterListView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color.fromRGBO(39, 43, 51, 1),
        child: ListView(
        children: context.select((ViewModel vm) => vm.state.characters.map(
                (character) => CharacterWidget(character: character)).toList()
        ),
      ),
    );
  }
}

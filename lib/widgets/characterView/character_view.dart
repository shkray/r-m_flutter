import 'package:flutter/material.dart';
import 'character_widget.dart';



class CharacterListView extends StatelessWidget {
  const CharacterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color.fromRGBO(39, 43, 51, 1),
        child: ListView(
        children: List<Widget>.filled(15, const CharacterWidget()),
      ),
    );
  }
}

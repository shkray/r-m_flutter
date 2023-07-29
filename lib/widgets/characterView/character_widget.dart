import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top:8),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(60, 62, 68, 1),
            border: Border.all(color: Colors.black26),
            borderRadius: const BorderRadius.all(Radius.circular(9.0))
        ),
        child: Row(
          children: [
            Image.network(character.image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(character.name),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

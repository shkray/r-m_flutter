import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/characters.dart';

class CharacterWidget extends StatelessWidget {
  final Result character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top:8),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(47, 62, 101, 1),
            border: Border.all(color: Colors.black26),
            borderRadius: const BorderRadius.all(Radius.circular(9.0))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                height: 220,
                width: 220,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(75),
                  child: CircularProgressIndicator(),
                ),
                imageUrl: character.image
            ),
            Padding(
              padding: const EdgeInsets.all(13.5),
              child: SizedBox(
                height: 193,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              character.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w800
                              )
                          ),
                          Text(
                            '${character.status} - ${character.species}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ]
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            "Last known location:",
                            style: TextStyle(
                              color: Color.fromRGBO(158, 158, 158, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),
                        ),
                        Text(
                            character.location['name']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400
                            ),
                        )
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'First seen in',
                            style: TextStyle(
                                color: Color.fromRGBO(158, 158, 158, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),
                        ),
                        // TODO: make episode handler
                        Text(
                            'Episode',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

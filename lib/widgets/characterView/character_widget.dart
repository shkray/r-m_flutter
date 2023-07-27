import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({super.key});

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
        child: const Row(
          children: [
            Expanded( flex: 3, child: SizedBox(height:100, child: Placeholder())),
            Expanded(flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("naming"),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

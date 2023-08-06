import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/widgets/characterView/search_provider.dart';
import '../../resources/images.dart';

class AppBarGradientWidget extends StatelessWidget {
  const AppBarGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  Color.fromRGBO(179, 219, 45, 1),
                  Color.fromRGBO(47, 134, 56, 1)
                ]
            )
        )
    );
  }
}

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0, right: 16.0),
            child: Image(image: Images.logo, filterQuality: FilterQuality.high, height: 50,),
          ),
          Text("Rick and Morty guide", style: TextStyle(
              color: Color.fromRGBO(32, 35, 41, 1),
              fontWeight: FontWeight.w700,
              fontSize: 21
          ))
        ]
    );
  }
}

class AppBarActionsWidget extends StatelessWidget{
  const AppBarActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
        return IconButton(
            onPressed: context.read<SearchProvider>().changeState,
            icon: const Icon(Icons.search)
        );
  }
}
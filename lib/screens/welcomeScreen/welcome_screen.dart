import 'package:flutter/material.dart';

import '../../images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarGradientWidget(),
          //leading: const AppBarLeadingWidget(),
          title: const AppBarTitleWidget(),
          actions: [
            IconButton(
                onPressed: () => showSearch(context: context, delegate: MySearchDelegate()),
                icon: const Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}

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

class MySearchDelegate extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => {
          if (query.isEmpty) {close(context, null)}
          else {query = ''}
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text("Result"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

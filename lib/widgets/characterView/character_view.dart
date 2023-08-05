import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'character_widget.dart';
import 'character_model.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ViewModel(),
        builder: (context, child) {
          var status = context.watch<ViewModel>().status;
          if (status) {
            return ListView.builder(
                controller: context.read<ViewModel>().scrollController,
                itemCount: context.read<ViewModel>().itemCount, //context.read<ViewModel>().characters.info.count,
                itemBuilder: (context, index){
                  //print('index: $index, count: ${context.read<ViewModel>().itemCount}');
                  return CharacterWidget(character: context.read<ViewModel>().characters.results[index]);
                }
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
      }
    );
  }
}

// Container(color: const Color.fromRGBO(39, 43, 51, 1),
// child: ListView(
// children: context.select((ViewModel vm) => vm.state.characters.map(
// (character) => CharacterWidget(character: character)).toList()
// ),
// ),
// );
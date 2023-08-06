import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'character_widget.dart';
import 'character_model.dart';
import 'search_provider.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({super.key});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
        create: (_) => ViewModel(),
        builder: (context, child) {
          bool status = context.watch<ViewModel>().status;
          if (status) {
            bool showSearch = context.watch<SearchProvider>().showSearch;
            //print(showSearch);
            return Column(children: [
                  if (showSearch) const SizedBox(height:100, child: Text('search')),
                  Expanded(
                    child: ListView.builder(
                      controller: context.read<ViewModel>().scrollController,
                        itemCount: context.read<ViewModel>().itemCount,
                        itemBuilder: (context, index){
                        //print('itemCount: ${context.read<ViewModel>().itemCount}, info: ${context.read<ViewModel>().characters.info.next}');
                          //print('index: $index, items: ${context.read<ViewModel>().itemCount}');
                          if (index == context.read<ViewModel>().itemCount-1){
                            //print('yeah');
                            return const Center(child: CircularProgressIndicator(),);
                          } else{
                            return CharacterWidget(character: context.read<ViewModel>().characters.results[index]);
                          }
                        }
                    ),
                  )
                ],
              );
          } else {
            return Container(
                padding: const EdgeInsets.all(40),
                alignment: Alignment.center,
                height: 200,
                child: const CircularProgressIndicator()
            );
          }
      }
    );
  }
}
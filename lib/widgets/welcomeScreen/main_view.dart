import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/domain/services/characters_service.dart';
import 'package:rick_and_morty_app/widgets/characterView/search_provider.dart';
import '../characterView/character_model.dart';
import '../characterView/character_view.dart';
import 'app_bar_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<SearchProvider>(
        create: (_) => SearchProvider(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: const AppBarGradientWidget(),
              title: const AppBarTitleWidget(),
              actions: const [AppBarActionsWidget()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(175, 216, 236, 1),
              items: BottomNavigationBarItems.items,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            body: const CharacterListView()
          );
        }
      ),
    );
  }
}

class BottomNavigationBarItems{
  static final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Characters"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.location_on),
        label: "Locations"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.live_tv_outlined),
        label: "Episodes"
    )
  ];
}

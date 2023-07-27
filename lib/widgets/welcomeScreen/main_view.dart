import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/services/character_controller.dart';
import '../characterView/character_widget.dart';
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
      child: Scaffold(
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
        body: Container(color: const Color.fromRGBO(39, 43, 51, 1),
          child: ListView(
            children: List<Widget>.filled(15, const CharacterWidget()),
          ),
        )
      ),
    );
  }

  @override
  void initState() {
    CharacterController().allCharacters();
  }
}

class BottomNavigationBarItems{
  static final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Персонажи"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.location_on),
        label: "Локации"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.live_tv_outlined),
        label: "Эпизоды"
    )
  ];
}

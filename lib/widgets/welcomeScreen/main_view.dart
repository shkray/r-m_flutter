import 'package:flutter/material.dart';
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
        body: CharacterListView()
      ),
    );
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

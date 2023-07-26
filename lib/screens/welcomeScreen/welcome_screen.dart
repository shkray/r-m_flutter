import 'package:flutter/material.dart';
import 'app_bar_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          items: BottomNavigationBarItems.items,

        ),
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

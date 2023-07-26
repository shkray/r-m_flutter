import 'package:flutter/material.dart';
import 'app_bar_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarGradientWidget(),
          title: const AppBarTitleWidget(),
          actions: const [AppBarActionsWidget()],
        ),
      ),
    );
  }
}



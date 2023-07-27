import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/widgets/welcomeScreen/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: WelcomeScreen()
    );
  }
}
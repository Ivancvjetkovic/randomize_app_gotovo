import 'package:flutter/material.dart';

import 'package:randomize_app/mainScreen.dart';

import 'bloc/bloc.dart';

void main() {
  runApp(const RandomizeApp());
}

class RandomizeApp extends StatelessWidget {
  const RandomizeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Schyler'),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

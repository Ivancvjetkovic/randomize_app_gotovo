import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomize_app/drawer.dart';
import 'package:randomize_app/http_service.dart';
import 'package:randomize_app/mainScreen.dart';

import 'bloc/bloc.dart';

void main() {
  runApp(const RandomizeApp());
}

class RandomizeApp extends StatelessWidget {
  const RandomizeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameMoonWalk',
      home: TurtleSwimming(
        title: '',
      ),
    );
  }
}

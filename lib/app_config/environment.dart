import 'package:flutter/material.dart';
import 'package:turtle_game/auto_size/src/auto_size.dart';
import 'package:turtle_game/constants/constants.dart';


import 'my_app.dart';

enum EnvType { DEVELOPMENT, STAGING, PRODUCTION, TESTING }

class Environment {
  static Environment? value;

  late String baseUrl;
  EnvType environmentType = EnvType.DEVELOPMENT;

  Environment() {
    value = this;
    _init();
  }

  void _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    runAutoSizeApp(
      MyApp(),
      height: Constants.designHeight,
      width: Constants.designWidth,
    );
  }
}

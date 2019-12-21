import 'package:flutter/material.dart';

// gitQ theme color
const themes = <MaterialColor>[
  Colors.lightBlue,
  Colors.brown,
  Colors.amber,
  Colors.pink,
  Colors.grey,
];

class Global {
  static List<MaterialColor> get themes => themes;

  static Future init() async {

  }
}
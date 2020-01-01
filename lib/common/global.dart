import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gitq/models/profile.dart';
import 'dart:convert';

// gitQ theme color
const _themes = <MaterialColor>[
  Colors.lightBlue,
  Colors.brown,
  Colors.amber,
  Colors.pink,
  Colors.grey,
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  static const double sidePad = 16.0;
  static const double gutter = 5.0;

  static List<MaterialColor> get themes => _themes;

  static Future init() async {

  }

  static saveProfile() {
    _prefs.setString('profile', json.encode(profile.toJson()));
  }
}

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners(); // update profile
  }
}

class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme => Global.themes
    .firstWhere((e) => e.value == _profile.theme, orElse: () => Colors.blue);

  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500].value;
      notifyListeners();
    }
  }
}

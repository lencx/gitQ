/***
 * @author: lencx
 * @created_at: Dec 19, 2019
 **/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:gitq/api/git.dart';
import 'package:gitq/models/profile.dart';
import 'package:gitq/models/user.dart';
import 'style.dart';

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  static const String appName = 'gitQ';
  static const String proxy = 'localhost';

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static List<MaterialColor> get themes => APP_THEMES;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString('profile');
    print(_profile);
    if (_profile != null) {
      try {
        profile = Profile.fromJson(json.decode(_profile));
        // print(profile is String);
      } catch (e) {
        print('init error: $e');
      }
    }
    Git.init();
  }

  static saveProfile() {
    // print('save profile: ${json.encode(profile.toJson())}');
    _prefs.setString('profile', json.encode(profile.toJson()));
  }
}

class ProfileNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    // notify dependent widgets for updates
    super.notifyListeners();
  }
}

class ThemeModel extends ProfileNotifier {
  ColorSwatch get theme => Global.themes
    .firstWhere((e) => e.value == _profile.theme, orElse: () => Colors.orange);

  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500].value;
      notifyListeners();
    }
  }
}

class UserModel extends ProfileNotifier {
  User get user => _profile.user;

  bool get isLogin => user != null;

  set user(User user) {
    if (user?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}
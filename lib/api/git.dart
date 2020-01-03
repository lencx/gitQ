// import 'package:gitq/models/user.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';

import 'package:gitq/common/global.dart';
import 'package:gitq/models/user.dart';

class Git {
  Git([this.context]) {
    _options = Options(extra: {"context": context});
  }

  BuildContext context;
  Options _options;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com',
    headers: {
      HttpHeaders.acceptHeader: 'application/vnd.github.v3+json',
    }
  ));

  static void init() {
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (url) {
          return 'PROXY ${Global.proxy}:8888';
        };
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }

    // set token
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;
  }

  Future<User> login(String username, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$username:$pwd'));
    print(basic);
    var resp = await dio.get(
      '/users/$username',
      options: _options.merge(
        headers: { HttpHeaders.authorizationHeader: basic },
        extra: { 'noCache': true },
      ),
    );

    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    Global.profile.token = basic;
    print('login: ${resp.data}');
    return User.fromJson(resp.data);
  }
}

// Future<User> Login(String username, String pwd) async {

// }
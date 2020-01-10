/***
 * @author: lencx
 * @created_at: Dec 22, 2019
 **/
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';

import 'package:gitq/common/global.dart';
import 'package:gitq/models/user.dart';
import 'package:gitq/models/repo.dart';

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
    // https://github.com/flutterchina/dio/issues/113
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (url) {
          return 'PROXY ${Global.proxy}';
        };
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };
    }

    // set token
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;
  }

  Future<User> login(String username, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$username:$pwd'));
    // print(basic);
    var resp = await dio.get(
      '/user/$username',
      options: _options.merge(
        headers: { HttpHeaders.authorizationHeader: basic },
        extra: { 'noCache': true },
      ),
    );

    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    Global.profile.token = basic;
    // print('login: ${resp.data}');
    return User.fromJson(resp.data);
  }

  Future<List<Repo>> repos({
      Map<String, dynamic> queryParameters,
      bool refresh = false,
    }) async {
      if (refresh) {
        _options.extra.addAll({ 'refresh': true, 'list': true });
      }

      var resp = await dio.get<List>(
        'users/repos',
        queryParameters: queryParameters,
        options: _options,
      );

      return resp.data.map((e) => Repo.fromJson(e)).toList();
  }
}

// @author: lencx
// @create_at: Jan 12, 2020
import 'dart:convert';
import 'package:http/http.dart';

import 'package:gitq/config.dart';
import 'package:gitq/utils/http.dart';
import 'package:gitq/utils/tools.dart';
import 'package:gitq/models/oauth.dart';
import 'package:gitq/models/user.dart';


class Git {
  static final httpClient = Net(
    defaultHeaders: Config.GITHUB_HEAD,
    baseURL: Config.NET_GITHUB_API,
  );

  static Future<Oauth> login(String username, String password) async {
    final _basic = credentialsBasic(username, password);
    // print(Config.githubAuth());
    Response response = await httpClient.post(
      '/authorizations',
      body: Config.githubAuth(),
      headers: { 'Authorization': _basic },
    );
    Oauth oauth = Oauth.fromJson(json.decode(response.body));
    httpClient.mergeHead({'Authorization': 'token ${oauth.token}'});
    return oauth;
  }

  static Future<User> getUser(String username) async {
    Response response = await httpClient.get('/users/$username');
    return User.fromJson(json.decode(response.body));
  }
}
// @author: lencx
// @create_at: Jan 12, 2020
import 'dart:convert';

import 'package:gitq/config.dart';
import 'package:gitq/utils/net.dart';
import 'package:gitq/utils/tools.dart';
import 'package:gitq/models/oauth.dart';
import 'package:gitq/models/user.dart';
import 'package:gitq/models/github_error.dart';

class Git {
  // base config
  static final httpClient = Net(
    defaultHeaders: Config.GITHUB_HEAD,
    baseURL: Config.NET_GITHUB_API,
  );

  static setToken(String token) {
    httpClient.mergeHead({'Authorization': 'token $token'});
  }

  static Future<bool> login(String username, String password) async {
    String _basic = credentialsBasic(username, password);
    // print(Config.githubAuth());
    Response response = await httpClient.post(
      '/authorizations',
      body: Config.githubAuth(),
      headers: { 'Authorization': _basic },
    );
    int code = response.statusCode;
    /// 200: OK | 201: created
    if (code == 200 || code == 201) {
      Oauth oauth = Oauth.fromJson(json.decode(response.body));
      setToken(oauth.token);
      return true;
    } else {
      GithubError _body = GithubError.fromJson(json.decode(response.body));
      toast(_body.message);
      return false;
    }
  }

  static Future<User> getUser(String username) async {
    Response response = await httpClient.get('/users/$username');
    return User.fromJson(json.decode(response.body));
  }
}
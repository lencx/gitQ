// @author: lencx
// @create_at: Jan 12, 2020
import 'package:http/http.dart';

import 'package:gitq/utils/http.dart';
import 'package:gitq/config.dart';
import 'package:gitq/utils/tools.dart';


class Git {
  static final httpClient = Net(
    defaultHeaders: Config.GITHUB_HEAD,
    baseURL: Config.NET_GITHUB_API
  );

  static Future login(String username, String password) async {
    final _basic = credentialsBasic(username, password);
    // print(Config.githubAuth());
    Response response = await httpClient.post(
      '/authorizations',
      body: Config.githubAuth(),
      headers: { 'Authorization': _basic },
    );
    print(response.body);
  }
}
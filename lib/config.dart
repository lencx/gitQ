// @author: lencx
// @create_at: Jan 10, 2020
import 'dart:convert';
import 'package:gitq/models/authorizations.dart';

class Config {
  // *********** Global ***********
  /// application name
  static const String APP_NAME = 'gitQ';
  /// this will be `true` when the app is running in production.
  /// in debug and profile mode, this it will evaluate to `false`
  static bool get isRelease => bool.fromEnvironment('dart.vm.product');

  // *********** network ***********
  static const NET_GITHUB_API = 'https://api.github.com';
  static const NET_API_VERSION = 'application/vnd.github.v3+json';
  static const NET_CONTENT_TYPE = 'application/json';
  static const NET_CHARSET = 'utf-8';

  // *********** github oauth ***********
  // https://github.com/settings/applications
  static const OA_CLIENT_ID = '0ce10da5ceba85364243';
  static const OA_CLIENT_SECRET = '5b4e07ad413ec1185d9098c270915208e639c6e7';
  // https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps
  static const OA_SCOPES = ['repo', 'gist', 'notifications', 'user'];
  static const OA_CALLBACK = 'https://github.com/lencx/gitQ/redirect';

  static const GITHUB_HEAD = {
    'Accept': NET_API_VERSION,
    'Content-Type': NET_CONTENT_TYPE,
  };

  // initial github authorizations
  static githubAuth() {
    Authorizations _auth = Authorizations();
    _auth.appName = APP_NAME;
    _auth.clientId = OA_CLIENT_ID;
    _auth.clientSecret = OA_CLIENT_SECRET;
    _auth.scopes = OA_SCOPES;
    _auth.callback = OA_CALLBACK;
    return json.encode(_auth);
  }
}

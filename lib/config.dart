// @author: lencx
// @create_at: Jan 10, 2020
import 'package:gitq/models/authorizations.dart';

class Config {
  // *********** Global ***********
  /// proxy address
  static const String PROXY = 'localhost:8888';
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
  static const OA_CLIENT_ID = '0ce10da5ceba85364243';
  static const OA_CLIENT_SECRET = '';
  // https://developer.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/
  static const OA_SCOPES = ['repo', 'gist', 'notifications', 'user'];
}

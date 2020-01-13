// @author: lencx
// @create_at: Jan 04, 2020
import 'dart:convert';

class Validate {
  String notEmpty(String val, String errorText) {
    return val.trim().isNotEmpty ? null : errorText;
  }
}

String credentialsBasic(String username, String password) {
  final bytes = utf8.encode('$username:$password');
  final basic = base64.encode(bytes);
  return 'Basic $basic';
}
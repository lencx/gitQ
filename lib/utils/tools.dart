// @author: lencx
// @create_at: Jan 04, 2020
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

void toast(String msg, {
  bool isLong = false,
  int iosTime = 2,
  double fontSize = 16.0,
  Color bgColor = Colors.black,
  Color color = Colors.white,
  ToastGravity gravity = ToastGravity.BOTTOM,
}) {
  Toast _type = Toast.LENGTH_SHORT;
  if (isLong) {
    _type = Toast.LENGTH_LONG;
  }

  Fluttertoast.showToast(
    msg: msg,
    toastLength: _type,
    timeInSecForIos: iosTime,
    fontSize: fontSize,
    backgroundColor: bgColor,
    textColor: color,
    gravity: gravity,
  );
}
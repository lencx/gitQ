import 'package:flutter/material.dart';
import 'package:gitq/common/global.dart';
import 'app.dart';

void main() => Global.init()
  .then((e) => runApp(App()));

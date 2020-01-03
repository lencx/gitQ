import 'package:flutter/material.dart';

import 'package:gitq/common/global.dart';
import 'app.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  // https://stackoverflow.com/questions/57689492/flutter-unhandled-exception-servicesbinding-defaultbinarymessenger-was-accesse
  // https://github.com/flutter/flutter/issues/40253
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(App()));
}

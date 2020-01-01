import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/style.dart';
import 'screens/login.dart';
import 'screens/setting/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => 'lencx'),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SettingTheme(),
        routes: {
          'login': (context) => LoginPage(),
          'setting': (context) => SettingTheme(),
        },
        theme: ThemeData(
          primaryColor: Colors.red,
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(title: appBarTextStyle),
          ),
          // textTheme: TextTheme(
          //   title: titleTextStyle,
          //   body1: body1TextStyle,
          // ),
        )
      )
    );
  }
}
/***
 * @author: lencx
 * @created_at: Dec 29, 2019
 **/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gitq/common/style.dart';
import 'package:gitq/common/global.dart';
import 'package:gitq/screens/init.dart';
import 'package:gitq/screens/setting/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider(create: (_) => 'lencx'),
        // Provider<ThemeModel>(create: (_) => ThemeModel()),
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, Widget child) {
          // print("app theme: ${themeModel.theme}");
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // home: SettingTheme(),
            home: InitScreen(),
            routes: {
              // 'login': (context) => LoginPage(),
              'setting': (context) => SettingTheme(),
            },
            theme: ThemeData(
              primarySwatch: themeModel.theme,
              // primaryColor: Colors.red,
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(title: appBarTextStyle),
              ),
              // textTheme: TextTheme(
              //   title: titleTextStyle,
              //   body1: body1TextStyle,
              // ),
            )
          );
        }
      )
    );
  }
}
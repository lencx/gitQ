import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'demo/location_detail.dart';
import 'common/style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationDetail(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: appBarTextStyle),
        ),
        textTheme: TextTheme(
          title: titleTextStyle,
          body1: body1TextStyle,
        ),
      )
    );
  }
}
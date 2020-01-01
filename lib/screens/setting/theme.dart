import 'package:flutter/material.dart';
import 'package:gitq/common/global.dart';
import 'package:gitq/layout/pad.dart';

class SettingTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting/Theme'),
      ),
      body: ListView.builder(
        itemCount: Global.themes.length,
        itemBuilder: (context, idx) {
          return GestureDetector(
            child: PadContainer(Container(
              color: Global.themes[idx],
              height: 40,
            )),
            onTap: () {
              print(Global.themes[idx]);
            },
          );
        },
      )
    );
  }
}
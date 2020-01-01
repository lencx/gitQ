import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          final _theme = Global.themes[idx];
          return GestureDetector(
            child: PadContainer(Container(
              color: _theme,
              height: 40,
            )),
            onTap: () {
              // print('theme.dart: $_theme');
              Provider.of<ThemeNotifier>(context, listen: false).theme = _theme;
            },
          );
        },
      )
    );
  }
}
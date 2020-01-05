/***
 * @author: lencx
 * @create_at: Jan 04, 2020
 **/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gitq/common/global.dart';
import 'get_avatar.dart';

Widget gitQDrawer() {
  return Consumer<UserModel>(
    builder: (BuildContext context, UserModel userModel, Widget child) {
      // print('w-user: ${userModel.user}');
      final user = userModel.user;
      return Scaffold(
        appBar: AppBar(
          title: Text('Me'),
        ),
        body: Drawer(
          // elevation: 10.0,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        getAvatar(
                          user.avatarUrl,
                          width: 50.0,
                          height: 50.0,
                        ),
                        // Image.asset('assets/logo/gitQ.png'),
                        Text('username: ${user.login}'),
                        Text('name: ${user.name}'),
                        // TODO: webview
                        Text('blog: ${user.blog}'),
                        Text('location: ${user.location}'),
                        // TODO: send email
                        Text('email: ${user.email}'),
                        Text('bio: ${user.bio}'),
                      ],
                    )
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('Theme'),
                ),
                ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: Text('Log Out'),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

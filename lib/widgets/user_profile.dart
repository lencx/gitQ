/***
 * @author: lencx
 * @create_at: Jan 04, 2020
 **/
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me'),
      ),
      body: Drawer(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text('Avatar'),
                      Text('Email'),
                      Text('Status'),
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
  }
}

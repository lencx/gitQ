/***
 * @author: lencx
 * @create_at: Jan 04, 2020
 **/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gitq/common/global.dart';
import 'package:gitq/widgets/user_profile.dart';
// import 'package:gitq/models/user.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Global.appName),
      ),
      body: _buildBody(context),
      drawer: UserProfile(),
    );
  }
}

Widget _buildBody(BuildContext context) {
  UserModel userModel = Provider.of<UserModel>(context);

  if (!userModel.isLogin) {
    return LoginPage();
  } else {
    return Text('Github Repos List');
  }

  // print(userModel.isLogin);
  // return Text('1234');
}
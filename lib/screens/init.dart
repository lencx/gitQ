/***
 * @author: lencx
 * @create_at: Jan 04, 2020
 **/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gitq/common/global.dart';
import 'package:gitq/widgets/drawer.dart';
import 'package:gitq/widgets/infinite_listview.dart';

import 'login.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(Global.appName),
      ),
      body: _buildBody(context, userModel),
      drawer: userModel.isLogin ? gitQDrawer() : null,
    );
  }
}

Widget _buildBody(BuildContext context, UserModel userModel) {
  if (!userModel.isLogin) {
    return LoginScreen();
  } else {
    // return Text('Github Repos List');
    return InfiniteListview();
  }
}
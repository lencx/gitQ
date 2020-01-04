/***
 * @author: lencx
 * @created_at: Dec 19, 2019
 **/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gitq/api/git.dart';
import 'package:gitq/common/global.dart';
import 'package:gitq/models/user.dart';
import 'package:gitq/utils/tools.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _formKey = GlobalKey<FormState>();
  Validate _validate = Validate();
  TextEditingController _usernameControl = TextEditingController();
  TextEditingController _pwdControl = TextEditingController();
  bool _pwdShow = false;

  void _onLogin() async {
    // validate form
    if ((_formKey.currentState as FormState).validate()) {
      User user;
      // print('login: ${_formKey.currentState}');
      try {
        user = await Git(context).login(_usernameControl.text, _pwdControl.text);
        // print('[ok]: $user');
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        if (e.response?.statusCode == 401) {
          print('Incorrect username or password.');
        } else {
          print(e.toString());
        }
      } finally {
        print('end');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  validator: (val) => _validate.notEmpty(val, 'Please enter username'),
                  controller: _usernameControl,
                  decoration: InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              TextFormField(
                controller: _pwdControl,
                obscureText: !_pwdShow,
                validator: (val) => _validate.notEmpty(val, 'Please enter password'),
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_pwdShow ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _pwdShow = !_pwdShow;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _onLogin(),
                    textColor: Colors.white,
                    child: Text('Sign up for GitHub')
                  )
                )
              ),
            ]
          )
        )
      )
    );
  }
}

// String validate(String val, String errorText) {
//   return val.trim().isNotEmpty ? null : errorText;
// }
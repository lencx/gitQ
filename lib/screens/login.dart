/***
 * @author: lencx
 * @created_at: Dec 19, 2019
 **/
import 'package:flutter/material.dart';

import 'package:gitq/api/git.dart';
import 'package:gitq/models/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _usernameControl = TextEditingController();
  TextEditingController _pwdControl = TextEditingController();
  bool pwdShow = false;

  void _onLogin() async {
    User user;
    // validate form
    if ((_formKey.currentState as FormState).validate()) {
      print('login: ${_formKey.currentState}');
    }
    try {
      user = await Git(context).login(_usernameControl.text, _pwdControl.text);
      print('[ok]: $user');
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gitQ'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  validator: (val) => validate(val, 'Please enter username'),
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
                obscureText: !pwdShow,
                validator: (val) => validate(val, 'Please enter password'),
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(pwdShow ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        pwdShow = !pwdShow;
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

String validate(val, errorText) {
  return val.trim().isNotEmpty ? null : errorText;
}
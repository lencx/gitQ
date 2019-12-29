import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool pwdShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('gitQ'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              TextField(
                obscureText: !pwdShow,
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
                    onPressed: () {},
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

void _onLogin() async {

}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';
import './Dashboard.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String _email, _password;

  Future<void> login() async {
    final formdata = formState.currentState;
    if (formdata.validate()) {
      formdata.save();

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
            (Route<dynamic> route) => false);


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Form(
                    key: formState,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'Email Address'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                            },
                            onSaved: (val) => _email = val,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.vpn_key),
                                hintText: 'Password'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Enter Your Password';
                              } else if (val.length < 3) {
                                return 'your Password need to be atleast 4 char';
                              }
                            },
                            onSaved: (val) => _password = val,
                          ),
                          RaisedButton(
                            color: Colors.lightBlueAccent,
                            textColor: Colors.white,
                            onPressed: login,
                            child: Text('Login'),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

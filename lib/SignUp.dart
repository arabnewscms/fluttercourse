import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Dashboard.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String _email, _password;

  Future<void> signUp() async {
    final formdata = formState.currentState;
    if (formdata.validate()) {
      formdata.save();

      FirebaseUser fireuser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);

      fireuser.sendEmailVerification();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Dashboard()),
          (Route<dynamic> route) => false
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignUp'),
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
                            onPressed: signUp,
                            child: Text('SignUp'),
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

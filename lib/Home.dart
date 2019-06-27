import 'package:flutter/material.dart';
import './Login.dart';
import './SignUp.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts App'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      textColor: Colors.white,
                      color: Colors.lightBlueAccent,
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                    Text('OR'),
                    FlatButton(
                      textColor: Colors.white,
                      color: Colors.lightBlueAccent,
                      child: Text('SignUp'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

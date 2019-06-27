import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';
class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }

}

class DashboardState extends State<Dashboard>{
   FirebaseUser user;
   final auth = FirebaseAuth.instance;
  Future<void> getUserData() async{
    FirebaseUser userData = await FirebaseAuth.instance.currentUser();
    setState(() {
      user = userData;
    });
  }

  Future<void> _signout() async{
    auth.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts App'),
        actions: <Widget>[
          FlatButton(
          //  color: Colors.white,
            child: Text('SignOut'),
            onPressed: _signout,
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           // Text('Welcome ${user.email}')
          ],
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import './Home.dart';
import './Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  final auth = await FirebaseAuth.instance.currentUser();
  return runApp(MaterialApp(
    title: 'My Contacts App',
    debugShowCheckedModeBanner: false,
    home: auth==null?Home():Dashboard(),
    theme: ThemeData.light(),
  ));
}
// C R U D

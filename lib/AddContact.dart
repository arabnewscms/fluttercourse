import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Home.dart';


class AddContact extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return  AddContactState();
  }

}

class AddContactState extends State<AddContact>{
  CrudFire crud = new CrudFire();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String _email,_mobile,_name;

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

  addContact(){
    if(formState.currentState.validate()){
      formState.currentState.save();

    }
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
        title: Text('Add New Contact'),
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
            Form(
              key: formState,
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'Name'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Enter Name Of Contact';
                        }
                      },
                      onSaved: (val) => _name = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Email Address'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Email Of Contact';
                        }
                      },
                      onSaved: (val) => _email = val,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: 'Mobile'),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Enter Mobile Of Contact';
                        } else if (val.length < 14) {
                          return 'your Mobile need to be atleast 14 Number';
                        }
                      },
                      onSaved: (val) => _mobile = val,
                    ),
                    RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      onPressed: addContact,
                      child: Text('Add New Contact'),
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
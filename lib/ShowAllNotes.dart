import 'package:flutter/material.dart';

class ShowAllNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowAllNotesState();
  }

}

class ShowAllNotesState extends State<ShowAllNotes>{
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notes'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }



}
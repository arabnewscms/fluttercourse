import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotesState();
  }

}

class AddNotesState extends State<AddNotes>{
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
    String notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notes'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Form(
              key: formState,
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLines: null,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        counterText: 'Enter Notes Unlimted Data',
                        suffixText: 'Your Notes'
                      ),
                      onSaved: (val)=> notes = val,
                      validator: (val){
                        if(val.isEmpty){
                          return 'Please Enter data';
                        }
                      },
                    ),
                    FlatButton(
                      child: Text('Add Notes'),
                      onPressed: addNotes,
                      color: Colors.green,
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


  addNotes(){
    if(formState.currentState.validate()){
      formState.currentState.save();
      print(notes);
    }
  }

}
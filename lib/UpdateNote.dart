import 'package:flutter/material.dart';
import 'Model/Notes.dart';
class UpdateNote extends StatefulWidget{
  int id;
  String notedata;
  UpdateNote(this.id,this.notedata);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UpdateNoteState();
  }

}

class UpdateNoteState extends State<UpdateNote>{
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  String notes;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
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
                     // maxLines: null,
                      initialValue: widget.notedata,
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
                      child: Text('Update Note'),
                      onPressed: updateNotes,
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


  updateNotes() async{
    if(formState.currentState.validate()){
      formState.currentState.save();
      // Notes().create();
      int add = await Notes().update(
        id: widget.id,
        note: notes
      );
      print('record updated');
    }
  }

}
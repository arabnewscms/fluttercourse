import 'package:flutter/material.dart';
import 'Model/Notes.dart';
import 'UpdateNote.dart';
class ShowAllNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowAllNotesState();
  }

}

class ShowAllNotesState extends State<ShowAllNotes>{
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  List data = new List();
  List checklist = List();
  void loadData() async{
    Notes().getData().then((result){
      setState(() {
        data.addAll(result);
      });
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Notes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              //for(int id in checklist){
                Notes().deleteAll(checklist);
              //}
              Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (context)=>ShowAllNotes()
                )
              );
            },
          )
        ],
      ),
      body: showData()
    );
  }


  Widget showData(){
   if(data != null && data.length > 0) {
     return ListView.builder(
         itemCount: data.length,
         itemBuilder: (context, index) {
           return ListTile(
             trailing: Checkbox(
                 value: checklist.contains(data[index]['id']), //data[index]['id'],
                 onChanged: (bool val){

                  setState(() {

                    checklist.contains(data[index]['id'])?
                    checklist.remove(data[index]['id']):
                    checklist.add(data[index]['id']);

                  });
                  print(checklist);
                 }
             ),
             title: Text('${data[index]['note']}'),
             onTap: () {
               //data[index]['id']
               Navigator.push(context, MaterialPageRoute(
                   builder: (context)=>UpdateNote(data[index]['id'],data[index]['note'])
               ));
             },
           );
         }
     );
   }else if(data == null){
     return Text('No Data At this time');
   }
  }


}
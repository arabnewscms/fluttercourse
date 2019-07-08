import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import './AddNotes.dart';
import './ShowAllNotes.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SQLITE Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             FlatButton(
               child: Text('New Notes'),
               textColor: Colors.white,
               color: Colors.lightBlue,
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(
                     builder: (context)=> AddNotes()
                 ));
               },
             ),
            Padding(padding: EdgeInsets.only(left: 10),),
            FlatButton(
              child: Text('Show All Notes'),
              textColor: Colors.white,
              color: Colors.lightBlue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> ShowAllNotes()
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

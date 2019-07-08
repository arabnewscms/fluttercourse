import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class Notes{
  String table = 'notes';
  static Database _db;

  Future<Database> get db async{
    if(_db == null){
      _db = await initialDB();
      return _db;
    }else{
      return _db;
    }
  }

  initialDB() async{
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path,'testdb.db');
    var mydb = await openDatabase(path,version: 1,onCreate: (Database db,int version) async{
      await db.execute('CREATE TABLE "$table" ("id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,"note"	TEXT NOT NULL)');
      print('Notes Table Created');
    });
    return mydb;
  }

  Future<int> create(Map<String,dynamic> data) async{
    var dbclient = await db;
    int insert = await dbclient.insert(table, data);
    return insert;
  }

  Future<List> getData({int id:0}) async{
    var dbclient = await db;
    if(id > 0){
      return await dbclient.query(table,where: 'id=$id');
    }else{
    return await dbclient.query(table);
    }
  }


  Future<int> update({String note:'',int id}) async{
    var dbclient = await db;
    int update = await dbclient.rawUpdate('Update $table set '
        'note="$note"'
        ' where id ="$id" ');
    return update;
  }



}
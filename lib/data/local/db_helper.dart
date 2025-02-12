import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

//db_helper and home_screen are one UI for sqlite
class DBHelper {
  ///Singleton
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();
  // static final DBHelper getInstance(){
  //   return DBHelper._();
  // }

  ///table note
  static final String TABLE_NOTE = 'note';
  static final String COLUMN_NOTE_SNO = 's_no';
  static final String COLUMN_NOTE_TITLE = 'title';
  static final String COLUMN_NOTE_DESC = 'desc';

  Database? myDB;

  ///db Open (path -> if exists then open else create db)
  Future<Database> getDB()async{

    ///writing like this
    myDB ??= await openDB();
    return myDB!;

    ///or in this format
    //myDB ?? await openDB();

    ///or in this format
    /*if(myDB != null){
      return myDB!;
    }else{
      myDB = await openDB();
      return myDB!;
    }*/
}

  Future<Database> openDB()async{
    Directory dirPath = await getApplicationDocumentsDirectory();
    String dbPath = join(dirPath.path,'noteDB.db');
    
    return await openDatabase(dbPath,onCreate: (db,version){
      ///create all tables here
      db.execute('create table $TABLE_NOTE ($COLUMN_NOTE_SNO integer primary key autoincrement,$COLUMN_NOTE_TITLE text,$COLUMN_NOTE_DESC text)');

    },version: 1);
}

  ///All queries
  ///Insertion

  Future<bool> addNote({required String mTitle,required String mDesc})async{
    var db = await getDB();
    int rowsEffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc
    });
    return rowsEffected > 0;
  }

  ///Fetching or selection or reading all data

  Future<List<Map<String,dynamic>>> getAllNotes()async{
    var db = await getDB();

    ///In a query we can write this 'select * from note'
    //db.query(TABLE_NOTE,columns: [COLUMN_NOTE_DESC]);
    List<Map<String,dynamic>> mData = await db.query(TABLE_NOTE);
    return mData;
  }

  ///Update data

  Future<bool> updateNote({required String mTitle, required String mDesc, required int sNo})async{
    var db = await getDB();

    int rowsEffected = await db.update(TABLE_NOTE, {
      COLUMN_NOTE_TITLE: mTitle,
      COLUMN_NOTE_DESC: mDesc
    },where: '$COLUMN_NOTE_SNO = $sNo');

    return rowsEffected > 0;
  }

  ///Delete Data

  Future<bool> deleteNote({required int sNo})async{
    var db = await getDB();

    int rowsEffected = await db.delete(TABLE_NOTE, where: '$COLUMN_NOTE_SNO = ?',whereArgs: ['$sNo']);

    return rowsEffected > 0;
  }
}
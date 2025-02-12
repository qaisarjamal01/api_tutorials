import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../model/database_model.dart';


//Sqflite stores static data
class DatabaseHandler{
  Database? _database;

  Future<Database?> get dataBase async{
    if(_database!=null) {
      return _database;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,'myDatabase.db');

    _database = await openDatabase(
     path,
      version: 1,

      onCreate: (db,version){
       db.execute(
         '''
         CREATE TABLE DatabaseTable(
         id INTEGER PRIMARY KEY,
         name TEXT,
         age INTEGER
         )
         '''
       );
      },
    );
    return _database;
  }
//   insertData(int id , String name, int age)async{
//     var dataMap = {
//       'id': id,
//       'name': name,
//       'age': age,
//     };
//     Database? db = await dataBase;
//     db!.insert('DatabaseTable', dataMap);
//     print('Data inserted successfully');
//   }
//   readData()async{
//     Database? db = await dataBase;
//     final dataList = await db!.query('DatabaseTable');
//     print(dataList);
//     return dataList;
//   }
//   deleteData(int id)async{
//     Database? db = await dataBase;
//     if(db == null){
//       print('database is not initialized');
//       return;
//     }
//     await db.delete('DatabaseTable',where: 'id = ?',whereArgs: [id]);
//     print('Delete Successfully');
//   }
//   updateData(int id,Map<String,Object?> data) async {
//     Database? db = await dataBase;
//     if(db == null){
//       print('Database is not initialized');
//       return;
//     }
//     await db.update('DatabaseTable', data,where: 'id = ?',whereArgs: [id]);
//     print('updated Successfully');
//   }
// }


//Now stores sqflite the dynamic data through model
// class DatabaseHandler{
//   Database? _database;
//
//   Future<Database?> get dataBase async {
//     if(_database != null){
//       return _database;
//     }
//
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path,'database.db');
//
//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db,version){
//         db.execute(
//           '''
//           CREATE TABLE DatabaseTable(
//           id INTEGER PRIMARY KEY,
//           name TEXT,
//           age INTEGER
//           )
//           '''
//         );
//       }
//     );
//     return _database;
//   }

  insertData(DatabaseModel databaseModel) async {
    Database? db = await dataBase;
    db!.insert('DatabaseTable', databaseModel.toMap());
    print('Data inserted Successfully');
  }

  readData() async {
    Database? db = await dataBase;
    final dataList = await db!.query('DatabaseTable');
    print(dataList);
    return dataList.map((item)=> DatabaseModel.fromMap(item)).toList();
  }
}
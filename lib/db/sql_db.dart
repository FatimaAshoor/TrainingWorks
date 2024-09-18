import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';

class SqlDb{
  static String dbName= "notes_db";
  static int dbVersion= 1;

  static String tableName= "note";
  static String columnId = "id";
  static String columnTitle= "title";
  static String columnContent= "content";

  static Database? _database;
  Future<Database?> get database async{
    if(_database == null){
      _database = await initialDb();
      return _database;
    } else {
      return _database;
    }
  }
  initialDb() async {
    String dbPath = await getDatabasesPath();
    Database notesDb = await openDatabase(join(dbPath,'$dbName.db'), onCreate: _onCreate, version: dbVersion, onUpgrade: _onUpgrade);
    return notesDb;
  }

  _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE "$tableName" (
        $columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnContent TEXT NOT NULL);
        ''');
    print("**************** Created DB & table ****************");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
      /*await db.execute('''
      ALTER TABLE "$tableName" 
      ADD COLUMN "$columnDate" INTEGER NOT NULL DEFAULT 0;
    ''');
      print("**************** Updated DB & added date column ****************");*/
  }

  Future<List<NoteModel>> readData(String sql) async {
    Database? notesDb = await database;
    List<Map> response = await notesDb!.rawQuery(sql);
    return response.map((noteMap) => NoteModel.fromJson(noteMap)).toList();
  }

  Future<int> insertData(String sql,NoteModel noteModel) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawInsert(sql, [noteModel.title, noteModel.content]);
    return response;
  }

  Future<int> updateData(NoteModel noteModel) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawUpdate("UPDATE $tableName SET title = ?, content = ? WHERE id = ?;", [noteModel.title, noteModel.content, noteModel.id]);
    return response;
  }

  Future<int> deleteData(NoteModel noteModel) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawDelete("DELETE FROM $tableName WHERE id = ${noteModel.id};");
    return response;
  }
}
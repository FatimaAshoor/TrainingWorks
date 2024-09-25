import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_works/models/task_model.dart';


class SqlDb{
  static String dbName= "todo_db";
  static int dbVersion= 1;

  static String tableName= "tasks";
  static String columnId = "id";
  static String columnTitle= "title";
  static String columnContent= "detail";
  static String columnDone= "done";

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
        $columnContent TEXT NOT NULL,
        $columnDone TEXT NOT NULL);
        ''');
    print("**************** Created DB & table ****************");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
  }

  Future<List<TaskModel>> readData(String sql) async {
    Database? notesDb = await database;
    List<Map> response = await notesDb!.rawQuery(sql);
    return response.map((noteMap) => TaskModel.fromJson(noteMap)).toList();
  }

  Future<int> insertData(String sql,TaskModel noteModel) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawInsert(sql, [noteModel.title, noteModel.detail]);
    return response;
  }

  Future<int> updateData(TaskModel noteModel) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawUpdate("UPDATE $tableName SET title = ?, content = ? WHERE id = ?;", [noteModel.title, noteModel.detail, noteModel.id]);
    return response;
  }

  Future<int> deleteData(TaskModel noteModel) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawDelete("DELETE FROM $tableName WHERE id = ${noteModel.id};");
    return response;
  }
}
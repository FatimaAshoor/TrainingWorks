import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb{

  static Database? _database;

  Future<Database?> get database async{
    if(_database == null){
      _database = await intialDb();
      return _database;
    } else {
      return _database;
    }
  }

  intialDb() async {
    String dbPath = await getDatabasesPath();
    Database notesDb = await openDatabase(join(dbPath,'notes.db'), onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return notesDb;
  }

  _onCreate(Database db, int version) async{
    await db.execute(
        '''
        create table "notes" ( "id" integer not null primary key autoincrement, "title" text not null, "content" text not null)
        ''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion){

  }

  readData(String sql) async {
    Database? notesDb = await database;
    List<Map> response = await notesDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? notesDb = await database;
    int response = await notesDb!.rawDelete(sql);
    return response;
  }
}
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb{
  static String dbName= "notes_db";
  static int dbVersion= 1;

  static String tableName= "notes";
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
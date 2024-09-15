import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_works/model/post_model.dart';

class SqlDb{
  static String dbName= "posts";
  static int dbVersion= 1;

  static String tableName= "post";
  static String columnId = "id";
  static String columnTitle= "title";
  static String columnBody= "body";

  // Singleton Pattern
  static final SqlDb sqlDb = SqlDb._();
  SqlDb._();

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
    Database postsDb = await openDatabase(join(dbPath,'$dbName.db'), onCreate: _onCreate, version: dbVersion);
    return postsDb;
  }

  // To Create Tables
  _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE "$tableName" (
         $columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
         $columnTitle TEXT NOT NULL,
         $columnBody TEXT NOT NULL
        );
        ''');
  }

  Future<List<PostModel>> readData(String sql) async {
    Database? db = await database;
    List response = await db!.rawQuery(sql);
      return response.map((postMap) => PostModel.fromJson(postMap)).toList();
  }

  Future<int> insertData(PostModel postsModel) async {
    Database? db = await database;
    int response = await db!.rawInsert("INSERT INTO post (title, body) VALUES (?, ?)", [postsModel.title, postsModel.body] );
    return response;
  }

}
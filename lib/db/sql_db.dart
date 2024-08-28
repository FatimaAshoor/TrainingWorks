import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:training_works/model/post_model.dart';

class SqlDb{

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
    Database postsDb = await openDatabase(join(dbPath,'posts.db'), onCreate: _onCreate, version: 1);
    return postsDb;
  }

  // To Create Tables
  _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE "post" (
         id INTEGER NOT NULL PRIMARY KEY, 
         title TEXT NOT NULL,
         body TEXT NOT NULL
        );
        ''');
  }

  readData(String sql) async {
    Database? Db = await database;
    List<Map> response = await Db!.rawQuery(sql);
      return response;
  }

  insertData(PostModel postsModel) async {
    Database? Db = await database;
    int response = await Db!.rawInsert("INSERT INTO post (id, title, body) VALUES (?, ?, ?)", [postsModel.id, postsModel.title, postsModel.body] );
    return response;
  }

}
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    Database shoppingCartDb = await openDatabase(join(dbPath,'shopping_cart0.db'), onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return shoppingCartDb;
  }

  // To Create Tables
  _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE "products" ( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, description TEXT NOT NULL, price REAL NOT NULL);
        ''');
    print("**************** Created DB & table ****************");
  }
  _onUpgrade(Database db, int oldVersion, int newVersion) async{
    await db.execute(
        '''
        CREATE TABLE "cart" (
         id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
         productID INTEGER NOT NULL, FOREIGN KEY (productID) REFERENCES products(id)
        );
        ''');
    print("******************************* Created CART table ********************************");
  }

  readData(String sql) async {
    Database? shoppingCartDb = await database;
    List<Map> response = await shoppingCartDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? shoppingCartDb = await database;
    int response = await shoppingCartDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? shoppingCartDb = await database;
    int response = await shoppingCartDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? shoppingCartDb = await database;
    int response = await shoppingCartDb!.rawDelete(sql);
    return response;
  }
}
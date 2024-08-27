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
    Database tipsDb = await openDatabase(join(dbPath,'beauty_tips.db'), onCreate: _onCreate, version: 13, onUpgrade: _onUpgrade);
    return tipsDb;
  }

  // To Create Tables
  _onCreate(Database db, int version) async{
    await db.execute(
        '''
        CREATE TABLE "tips_type" (
         id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
         type TEXT NOT NULL,
         description TEXT NOT NULL
        );
        CREATE TABLE "tips" ( 
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        title TEXT NOT NULL, 
        content TEXT NOT NULL, 
        typeID INTEGER NOT NULL, FOREIGN KEY (typeID) REFERENCES tips_type(id),
        );
        ''');
    print("**************** Created DB & tables ****************");
  }
  _onUpgrade1(Database db, int oldVersion, int newVersion) async{
    await db.execute(
        '''
        INSERT INTO tips (content, typeID, title) VALUES ('Use a gentle non-irritating cleanser to wash your face twice a day Avoid over-cleansing which can strip your skin of its natural oils', 1, 'Cleanse Properly'), ('Apply a moisturizer suited to your skin type after cleansing This helps maintain your skin s hydration and barrier function.', 1, 'Moisturize Daily'), ('Use a broad-spectrum sunscreen with an SPF of 30 or higher every day, even on cloudy days. Reapply every 2 hours when outdoors.', 1, 'Wear Sunscreen'), ('Incorporate a gentle physical or chemical exfoliant 1-2 times per week to slough off dead skin cells and unclog pores.', 1, 'Exfoliate Regularly'), ('Consume a diet rich in antioxidants healthy fats and nutrients like vitamins C E and A to nourish your skin from the inside out.', 1, 'Eat a Healthy Diet'), ('Drink plenty of water throughout the day to keep your skin cells plump and healthy.', 1, 'Stay Hydrated'), ('Aim for 7-9 hours of quality sleep per night as sleep is crucial for skin repair and rejuvenation', 1, 'Get Enough Sleep');
        ''');
    print(" Done ");
  }

  _onUpgrade2(Database db, int oldVersion, int newVersion) async{
    await db.execute(
        '''
        INSERT INTO tips (content, typeID, title) VALUES ('Choose the Right Shampoo and Conditioner - Select a gentle sulfate-free shampoo that is tailored to your hair type e.g. dry oily color-treated. Use a moisturizing conditioner focusing on the mid-lengths and ends of your hair. Avoid over-washing as this can strip your hair of its natural oils.', 2, 'Choose the Right Shampoo and Conditioner'), ('Limit Heat Styling - Minimize the use of hot tools like blow dryers curling irons and straighteners as excessive heat can lead to dryness breakage and split ends. When using hot tools always apply a heat-protectant product and use the lowest heat setting possible. Allow your hair to air-dry whenever possible.', 2, 'Limit Heat Styling'), ('Get Regular Trims - Schedule trims every 6-8 weeks to remove split ends and maintain the overall health of your hair. Trimming just half an inch can make a significant difference in preventing further splitting and damage.', 2, 'Get Regular Trims'), ('Eat a Nutrient-Rich Diet - Consume a balanced diet that includes protein iron zinc biotin and vitamins A and E as these nutrients are essential for hair growth and strength. Good sources include lean meats eggs nuts seeds leafy greens and citrus fruits.', 2, 'Eat a Nutrient-Rich Diet');
        ''');
    print(" hair tips Done ");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async{
    await db.execute(
        '''
        INSERT INTO tips (content, typeID, title) VALUES ('Trim your nails regularly keeping them at a comfortable length. File them gently in one direction to avoid splitting or tearing.', 3, 'Keep Nails Trimmed and Filed');
        ''');
    print(" Done ");
  }

  readData(String sql) async {
    Database? tipsDb = await database;
    List<Map> response = await tipsDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? tipsDb = await database;
    int response = await tipsDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? tipsDb = await database;
    int response = await tipsDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? tipsDb = await database;
    int response = await tipsDb!.rawDelete(sql);
    return response;
  }
}
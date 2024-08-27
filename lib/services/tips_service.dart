import 'package:training_works/db/sql_db.dart';

class TipsService{
  SqlDb _sqlDb = SqlDb();

  Future<List<Map>> showTipsType() async {
    List<Map> response = await _sqlDb.readData("SELECT * FROM tips_type;");
    return response;
  }

  Future<List<Map>> showTips(int i) async {
    List<Map> response = await _sqlDb.readData("SELECT * FROM tips WHERE typeId= $i;");
    return response;
  }

}
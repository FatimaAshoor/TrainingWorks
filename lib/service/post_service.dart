import 'dart:convert';
import 'package:http/http.dart';
import 'package:training_works/db/sql_db.dart';
import 'package:training_works/model/post_model.dart';

class PostService{

  Future getDataFromAPI() async {
    var response = await get(Uri.parse("https://dummyjson.com/posts"));

    if(response.statusCode ==200){
      var data = jsonDecode(response.body);

      var sqlDb = SqlDb.sqlDb;

      for(var p in data["posts"]){
        await sqlDb.insertData(
          PostModel.fromJson(p),
        );
      }
      return data;
    }
    else{
      return "ERROR";
    }
  }

  Future addData(String title, String body ) async{
    try{
      var res = await post(Uri.parse("https://dummyjson.com/posts"), body: {
        jsonEncode({
          'title' : title,
          'body' : body
        })
      });
      if(res.statusCode == 201){
        return PostModel.fromJson(jsonDecode(res.body));
      }
    }
    catch(e){
      print("Error :\n $e");
    }
  }

  Future updateData(int id, String title, String body ) async{
    try{
      var res = await put(Uri.parse("https://dummyjson.com/posts/$id"), body: {
        jsonEncode({
          'id' : id.toString(),
          'title' : title,
          'body' : body
        })
      });
      if(res.statusCode ==200){
        return PostModel.fromJson(jsonDecode(res.body));
      }
    }
    catch(e){
      print("Error :\n $e");
    }
  }

  Future deleteData(int id) async{
    var res = await delete(Uri.parse("https://dummyjson.com/posts/$id"));
      if(res.statusCode == 201 || res.statusCode ==200){
        return PostModel.fromJson(jsonDecode(res.body));
      }
      else{
        print("ERROR");
      }
  }

  Future<List<PostModel>> showPosts() async {
    var sqlDb = SqlDb.sqlDb;
    return await sqlDb.readData("SELECT * FROM post");
  }

}
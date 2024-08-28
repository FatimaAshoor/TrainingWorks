import 'dart:convert';

import 'package:http/http.dart';

import 'package:training_works/db/sql_db.dart';
import 'package:training_works/model/post_model.dart';

class PostService{

  Future getDataFromAPI() async {
    var response = await get(Uri.parse("https://dummyjson.com/posts"));

    if(response.statusCode ==200){
      var data = jsonDecode(response.body);

      SqlDb sqlDb = SqlDb();

      for(var p in data){
        await sqlDb.insertData(
          PostModel(
              id: p["posts"]["id"],
              title: p["posts"]["title"],
              body: p["posts"]["body"]
          ),
        );
      }
      return data;
    }

    else{
      return "ERROR";
    }

  }

  Future<List<Map>> showPosts() async {
    SqlDb sqlDb = SqlDb();
    List<Map> response = await sqlDb.readData("SELECT * FROM post");
    return response;
  }


}
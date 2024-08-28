import 'package:flutter/material.dart';

import '../service/post_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostService postService = PostService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dealing with API"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            MaterialButton(
              onPressed: (){
                setState(() {
                  postService.getDataFromAPI();
                });
              },
              child: Text("Get data and Save it on db"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: FutureBuilder(
                  future: postService.showPosts(),
                  builder: (context, snap){
                    if(snap.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    else if (snap.connectionState==ConnectionState.done){
                      if(snap.hasError){
                        return Center(child: Text("ERROR", style: TextStyle(fontSize: 30),),);
                      }
                      if(snap.hasData){
                        return ListView.builder(
                            itemCount: snap.data!.length,
                            itemBuilder: (context, i){
                              return ListTile(
                                title: Text("${snap.data?[i]["title"]}"),
                                subtitle: Text("${snap.data?[i]["body"]}"),
                              );
                            });
                      }
                    }
                    return Text("");

                  }),
            ),
          ],
        ),
      ),
    );
  }
}

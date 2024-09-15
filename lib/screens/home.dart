import 'package:flutter/material.dart';
import 'package:training_works/screens/add_new.dart';
import 'package:training_works/screens/edit_content.dart';

import '../model/post_model.dart';
import '../service/post_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PostService postService = PostService();

  @override
  void initState() {
    postService.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dealing with API"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: postService.showPosts(),
              builder: (context, snap){
                if(snap.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                else if (snap.connectionState==ConnectionState.done){
                  if(snap.hasError){
                    return Center(child: Text("Error: ${snap.error}", style: const TextStyle(fontSize: 30),),);
                  }
                  if(snap.hasData){
                    return ListView.builder(
                        itemCount: snap.data!.length,
                        itemBuilder: (context, i){
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditContent(id: snap.data![i].id!)));
                            },
                            child: ListTile(
                              title: Text("${snap.data![i].title}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              subtitle: Text("${snap.data![i].body}"),
                              trailing: IconButton(
                                onPressed: (){
                                  postService.deleteData(snap.data![i].id!);
                                },
                                icon: const Icon(Icons.restore_from_trash),),
                            ),
                          );
                        });
                  }
                }
                return const Text("");

              }),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddNew()));
        },
        child: const Icon(Icons.add,),
      ),
    );
  }
}

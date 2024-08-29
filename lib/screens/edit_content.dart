import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service/post_service.dart';



class EditContent extends StatefulWidget {
  final int id ;
  const EditContent({super.key, required this.id});

  @override
  State<EditContent> createState() => _EditContentState();
}

class _EditContentState extends State<EditContent> {
  TextEditingController titleController =TextEditingController();
  TextEditingController contentController =TextEditingController();


  PostService postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit",style: TextStyle(fontSize: 24),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(fontSize: 30, color: Colors.grey)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "write the content here",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          postService.updateData(widget.id, titleController.text, contentController.text);
          Navigator.of(context).pushNamed("home");
        },
        child:  Icon(Icons.check),
      ),
    );
  }
}
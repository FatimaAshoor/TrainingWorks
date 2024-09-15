import 'package:flutter/material.dart';
import 'package:training_works/screens/home.dart';

import '../service/post_service.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController titleController =TextEditingController();
  TextEditingController contentController =TextEditingController();

  PostService postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add",style: TextStyle(fontSize: 24),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(fontSize: 30, color: Colors.grey)
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
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
          postService.addData( titleController.text, contentController.text);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
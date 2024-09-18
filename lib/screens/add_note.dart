import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_works/constant/colors.dart';

import '../db/sql_db.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController =TextEditingController();
  TextEditingController contentController =TextEditingController();

  String noteTitle ="";
  String noteContent = "";

  SqlDb sqlDb = SqlDb();
  Future<int> addNote() async {
    int response = await sqlDb.insertData("INSERT INTO note (title, content) VALUES ('$noteTitle', '$noteContent')");
    print("---------------------------------------------------------- inserted");
    return response;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: NotesColor.black
        ),
        title: Text("Add Notes",style: TextStyle(color: NotesColor.black, fontSize: 24),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onChanged: (value){
                  noteTitle = titleController.text;
                },
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 30, color: Colors.grey)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: contentController,
                onChanged: (value){
                  noteContent = contentController.text;
                },
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
        backgroundColor: NotesColor.orange,
        onPressed: () async{
          addNote();
          Navigator.of(context).pushNamed("home");
        },
        child:  Icon(Icons.check),
      ),
    );
  }
}

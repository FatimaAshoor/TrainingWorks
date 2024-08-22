import 'package:flutter/material.dart';

import '../db/sql_db.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  String noteTitle ="";
  String noteContent = "";

  SqlDb sqlDb = SqlDb();
  Future<int> addNote() async {
    int response = await sqlDb.insertData("INSERT INTO 'notes' ('title', 'content') VALUES ($noteTitle, $noteContent);");
    print(response);
    return response;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value){
                  noteTitle = value;
                },
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 30, color: Colors.grey)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                onChanged: (value){
                  noteContent = value;
                },
                decoration: InputDecoration(
                  hintText: "write the content here",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNote();
          Navigator.of(context).pushNamed("home");
        },
        child:  Icon(Icons.check),
      ),
    );
  }
}

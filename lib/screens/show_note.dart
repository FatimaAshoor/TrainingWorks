import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../db/sql_db.dart';

class ShowNote extends StatefulWidget {
  final String noteTitle;
  final String noteContent;
  final int noteId;
  const ShowNote({super.key, required this.noteTitle, required this.noteContent, required this.noteId});

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController titleController =TextEditingController();
  TextEditingController contentController =TextEditingController();

  SqlDb sqlDb = SqlDb();
  Future<int> updateNote() async {
    int response = await sqlDb.updateData("UPDATE note SET 'title' = '${titleController.text}', 'content' = '${contentController.text}' WHERE id = ${widget.noteId} ");
    print("---------------------------------------------------------- Updated");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    String noteTitle = widget.noteTitle;
    String noteContent = widget.noteContent;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: NotesColor.black
          ),
          title: Text("Edit Notes",style: TextStyle(color: NotesColor.black, fontSize: 26),),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "$noteTitle",
                        hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: contentController,
                      decoration: InputDecoration(
                        hintText: "$noteContent",
                        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    )
                  ],
                ),
              )

          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            updateNote();
            Navigator.of(context).pushNamed("home");
          } ,
          backgroundColor: Colors.cyanAccent,
          child:  Icon(Icons.check, color: Colors.black,),
        )
    );
  }
}

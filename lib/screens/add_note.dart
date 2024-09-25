import 'package:flutter/material.dart';
import 'package:training_works/constant/colors.dart';
import 'package:training_works/model/note_model.dart';
import '../service/note_service.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController =TextEditingController();
  TextEditingController contentController =TextEditingController();

  NoteService noteService = NoteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesColor.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: NotesColor.white
        ),
        title: Text("Add Note",style: TextStyle(color: NotesColor.white, fontSize: 22),),
        backgroundColor: NotesColor.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(color: NotesColor.white),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(fontSize: 30, color: NotesColor.grey)
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: contentController,
                style: TextStyle(color: NotesColor.white),
                maxLines: 30,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "write the content here",
                    hintStyle: TextStyle(fontSize: 18, color: NotesColor.grey)
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: NotesColor.green,
        onPressed: () async{
          noteService.addNote(NoteModel(title: titleController.text, content: contentController.text));
          Navigator.of(context).pushNamed("home");
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

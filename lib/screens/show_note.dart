import 'package:flutter/material.dart';
import 'package:training_works/model/note_model.dart';
import 'package:training_works/service/note_service.dart';
import '../constant/colors.dart';

class ShowNote extends StatefulWidget {
  final int noteId;
  const ShowNote({super.key, required this.noteId});

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

class _ShowNoteState extends State<ShowNote> {
  GlobalKey<FormState> formKey = GlobalKey();
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
          title: Text("Edit Notes",style: TextStyle(color: NotesColor.white, fontSize: 22),),
          backgroundColor: NotesColor.black,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: noteService.showNote(NoteModel(id: widget.noteId)),
              builder: (context, snap){
                if(snap.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                else if (snap.connectionState==ConnectionState.done){
                  if(snap.hasError){
                    return Center(child: Text("ERROR:\n${snap.error}"),);
                  }
                  if(snap.hasData){
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: titleController,
                                style: TextStyle(color: NotesColor.white),
                                decoration: InputDecoration(
                                  hintText: "${snap.data!.first.title}",
                                  hintStyle: TextStyle(fontSize: 30, color: NotesColor.white),
                                  border: InputBorder.none,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              TextFormField(
                                controller: contentController,
                                style: TextStyle(color: NotesColor.white),
                                maxLines: 30,
                                decoration: InputDecoration(
                                  hintText: "${snap.data!.first.content}",
                                  hintStyle: TextStyle(fontSize: 18, color: NotesColor.white),
                                  border: InputBorder.none,
                                ),
                              )
                            ],
                          ),
                        )

                    );
                  }
                }

                return const Text("");

              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            noteService.updateNote(NoteModel(id: widget.noteId, title: titleController.text, content: contentController.text));
            Navigator.of(context).pushNamed("home");
          } ,
          backgroundColor: NotesColor.green,
          child:  Icon(Icons.check, color: NotesColor.black,),
        )
    );
  }
}

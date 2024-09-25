import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:training_works/constant/colors.dart';
import 'package:training_works/model/note_model.dart';
import 'package:training_works/screens/show_note.dart';
import 'package:training_works/widgets/note_card.dart';
import '../service/note_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NoteService noteService = NoteService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesColor.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: NotesColor.white
        ),
        title: Text("All Notes",style: TextStyle(color: NotesColor.white, fontSize: 22),),
        backgroundColor: NotesColor.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: FutureBuilder(
            future: noteService.loadNotes(),
            builder: (context, snap){
              if(snap.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              else if (snap.connectionState==ConnectionState.done){
                if(snap.hasError){
                  return Center(child: Text("ERROR:\n${snap.error}", style: TextStyle(fontSize: 20, color: NotesColor.white),),);
                }
                if(snap.hasData){
                  return MasonryGridView.builder(
                    itemCount: snap.data!.length,
                      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                      ),
                      itemBuilder: (context, i){
                        return NoteCard(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShowNote(noteId:snap.data![i].id!,)));
                          },
                            onPressedIcon: (){
                              noteService.deleteNote(NoteModel(id: snap.data![i].id!));
                              Navigator.of(context).pushNamed("home");
                            },
                            cardColor: NotesColor.grey,//i%2==0? NotesColor.blue : NotesColor.orange,
                            title: "${snap.data?[i].title}",
                            content: "${snap.data?[i].content}",
                            colorTitle: NotesColor.white,
                            colorContent: NotesColor.lightGrey);
                      }
                  );
                }
              }
              return const Text("");

            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: NotesColor.green,
        onPressed: () {
          Navigator.of(context).pushNamed("addNote");
        },
        child:  Icon(Icons.add, color: NotesColor.grey,),
      ),
    );
  }
}

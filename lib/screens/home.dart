import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:training_works/constant/colors.dart';
import 'package:training_works/db/sql_db.dart';
import 'package:training_works/screens/show_note.dart';
import 'package:training_works/widgets/note_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readNote() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM note;");
    print(response);
    return response;
  }

  Future<List<Map>> deleteNote(var id) async {
    List<Map> response = await sqlDb.deleteData("DELETE FROM note WHERE id = $id;");
    print(response);
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: NotesColor.black
        ),
        title: Text("All Notes",style: TextStyle(color: NotesColor.black, fontSize: 24),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: readNote(),
            builder: (context, snap){
              if(snap.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else if (snap.connectionState==ConnectionState.done){
                if(snap.hasError){
                  return Center(child: Text("ERROR:\n${snap.error}"),);
                }
                if(snap.hasData){
                  return MasonryGridView.builder(
                    itemCount: snap.data!.length,
                      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, i){
                        return NoteCard(
                            cardColor: i%2==0? NotesColor.blue : NotesColor.orange,
                            title: "${snap.data?[i]["title"]}",
                            content: "${snap.data?[i]["content"]}",
                            colorTitle: NotesColor.black,
                            colorContent: NotesColor.white);
                      }
                  );
                }
              }

              return Text("");

            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: NotesColor.orange,
        onPressed: () {
          Navigator.of(context).pushNamed("addNote");
        },
        child:  Icon(Icons.add, color: NotesColor.black,),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:training_works/constant/colors.dart';
import 'package:training_works/db/sql_db.dart';
import 'package:training_works/screens/show_note.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readNote() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM notes;");
    print(response);
    return response;
  }

  Future<List<Map>> deleteNote(var id) async {
    List<Map> response = await sqlDb.deleteData("DELETE FROM notes WHERE id = $id;");
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
                  return Center(child: Text("ERROR"),);
                }
                if(snap.hasData){
                  return ListView.builder(
                    itemCount: snap.data!.length,
                      itemBuilder: (context, i){
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShowNote(noteTitle: snap.data?[i]["title"], noteContent: snap.data?[i]["title"], noteId: snap.data?[i]["id"],)));
                          },
                          child: Card(
                            color: i%2==0? NotesColor.blue : NotesColor.orange,
                            child: ListTile(
                              title: Text("${snap.data?[i]["title"]}", style: TextStyle(color: NotesColor.black, fontSize: 24, fontWeight: FontWeight.bold),),
                              subtitle: Text("${snap.data?[i]["content"]}", style: TextStyle(color: NotesColor.black, fontSize: 18),),
                              trailing: IconButton(
                                onPressed: (){
                                  setState(() {
                                    deleteNote(snap.data![i]["id"]);

                                  });
                                },
                                icon: Icon(Icons.restore_from_trash, color: Colors.red,),
                              ),

                            ),
                          ),
                        );
                      });
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

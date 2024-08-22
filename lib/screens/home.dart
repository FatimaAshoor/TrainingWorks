import 'package:flutter/material.dart';
import 'package:training_works/db/sql_db.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
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
                      itemBuilder: (context, i){
                        return Card(
                          child: ListTile(title: Text("${snap.data?[i]["title"]}"),),
                        );
                      });
                }
              }

              return Text("");

            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("addNote");
        },
        child:  Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  String? newTask;
  List tasks = ["task 1", "task 2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, i){
                  return ListTile(
                        title: Text("${tasks[i]}"),
                        leading: IconButton(onPressed: (){
                          setState(() {
                            tasks.removeAt(i);
                          });
                        },
                        icon: Icon(Icons.restore_from_trash),
                        ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(labelText: "write your task:"),
              onChanged: (input){
                newTask = input;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){setState(() {
              tasks.add(newTask);
            });}, child: Text("Add Your Task")),
          ],
        ),
      ),
    );
  }
}

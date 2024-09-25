import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_works/models/todo_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App"),),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<TodoModel>(
              builder: (context, todo, child){
                return ListView.builder(
                    itemCount: 10 ,
                    itemBuilder: (context, i){
                      return Container(
                        child: ListTile(
                          title: Text("title"),
                          subtitle: Text("detail"),
                        ) ,
                      );
                    });
              }
          ),

        ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Provider.of<TodoModel>(context, listen: true).addTask();
          }
      ),
    );
  }
}

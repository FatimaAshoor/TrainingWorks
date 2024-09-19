import 'package:flutter/cupertino.dart';
import 'package:training_works/models/task_model.dart';

class TodoModel extends ChangeNotifier{

  List<TaskModel> taskList = [];

  addTask(){
    TaskModel taskModel = TaskModel("title ${taskList.length}", " no detail of task ${taskList.length}");
    taskList.add(taskModel);
    notifyListeners();
  }
}
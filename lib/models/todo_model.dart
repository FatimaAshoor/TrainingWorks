import 'package:flutter/cupertino.dart';
import 'package:training_works/models/task_model.dart';

class TodoModel extends ChangeNotifier{



  addTask(){
    notifyListeners();
  }
}
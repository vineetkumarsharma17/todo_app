import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/task_model.dart';


class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; //contians all the task
  String ?time;
  String? getTime() => time;
  updateRemainingTime()
  {
    final DateTime now = DateTime.now();
    time= DateFormat('hh:mm:ss').format(now);
    notifyListeners();
  }
  addTaskInList(){
    TaskModel taskModel = TaskModel("title ${taskList.length}",
        "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);
    notifyListeners();
    //code to do
  }

}
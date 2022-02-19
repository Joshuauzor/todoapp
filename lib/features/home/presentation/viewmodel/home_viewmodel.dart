import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<TaskModel> get tasks => HomeService.tasks;

  void addTask(String taskTitle){
    final task = Task
  }
}

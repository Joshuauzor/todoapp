import 'dart:collection';

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  // List<Task> get tasks => HomeService.tasks;
  final List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskTitle) {
    final task = Task(name: taskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

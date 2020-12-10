import 'package:flutter/material.dart';
import './task.dart';

class Tasks with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get item {
    return [...this._tasks];
  }

  void addToTask(String name) {
    _tasks.add(Task(id: DateTime.now().toString(), name: name));
    notifyListeners();
  }

  String numberOfActiveTasks() {
    return _tasks.where((tasks) => tasks.isDone == false).toList().length.toString();
  }
}

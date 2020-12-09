import 'package:flutter/material.dart';
import './task_tile.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function checkboxCallback;

  const TaskList({this.tasks, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskTile(
        id: tasks[index].id,
        isChecked: tasks[index].isDone,
        taskTitle: tasks[index].name,
        checkboxCallback: checkboxCallback,
      ),
    );
  }
}
/*

},*/

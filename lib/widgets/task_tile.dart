import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String id;
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  const TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (condition) => checkboxCallback(id),
        //onChanged: changed,
      ),
    );
  }
}

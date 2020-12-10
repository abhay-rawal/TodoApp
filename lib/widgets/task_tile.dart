import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ProviderModels/task.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: (condition) => task.toggleDone(),
      ),
    );
  }
}

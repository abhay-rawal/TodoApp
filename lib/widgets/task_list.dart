import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ProviderModels/tasks.dart';
import './task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context).item;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20),
      itemCount: tasks.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: tasks[index],
        child: TaskTile(),
      ),
    );
  }
}
/*

},*/

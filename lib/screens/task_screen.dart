import 'package:flutter/material.dart';
import '../widgets/task_list.dart';
import './add_task_screen.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> leftTask = [];
  List<Task> tasks = [];

  void addToTasks(String name) {
    setState(() {
      tasks.add(Task(id: DateTime.now().toString(), name: name));
    });
  }

  void checkboxCallback(String id) {
    int index = tasks.indexWhere((element) => element.id == id);
    setState(() {
      tasks[index].toggleDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => AddTaskScreen(
            addToTasks: addToTasks,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30,
              bottom: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.where((element) => element.isDone == false).length.toString()} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: tasks.length == 0
                  ? Center(
                      child: Text(
                        'No Task left to do!',
                        style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
                      ),
                    )
                  : TaskList(
                      checkboxCallback: checkboxCallback,
                      tasks: tasks,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

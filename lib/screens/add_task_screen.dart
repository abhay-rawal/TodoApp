import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addToTasks;
  AddTaskScreen({this.addToTasks});

  final taskInputController = TextEditingController();

  void sub(BuildContext context, String taskName) {

    if (taskName != null) {
      addToTasks(taskName);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 40, right: 40, bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                ),
              ),
              TextField(
                controller: taskInputController,
                onSubmitted: (value) => sub(context, value),
                textAlign: TextAlign.center,
                autofocus: true,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  onPressed: () => sub(context, taskInputController.text),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

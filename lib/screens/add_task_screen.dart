import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ProviderModels/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  final taskInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context, listen: false);
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
                onSubmitted: (value) {
                  tasksData.addToTask(taskInputController.text);
                  Navigator.of(context).pop();
                } ,
                textAlign: TextAlign.center,
                autofocus: true,
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    tasksData.addToTask(taskInputController.text);
                    Navigator.of(context).pop();
                  },
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

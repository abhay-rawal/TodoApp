import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_fllutter/ProviderModels/tasks.dart';
import './screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

//provider Branch
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        home: SafeArea(child: TasksScreen()),
      ),
    );
  }
}

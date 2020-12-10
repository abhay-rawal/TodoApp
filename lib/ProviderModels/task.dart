import 'package:flutter/foundation.dart';

class Task with ChangeNotifier {
  final String id;
  final String name;
  bool isDone;

  Task({this.id, this.name, this.isDone = false});
  void toggleDone() {
    print('Hello World');
    isDone = !isDone;
    notifyListeners();
  }
}

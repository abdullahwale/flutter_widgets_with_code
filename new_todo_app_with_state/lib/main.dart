import 'package:flutter/material.dart';
import 'package:new_todo_app_with_state/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:new_todo_app_with_state/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

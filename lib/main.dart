import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modals/task_data.dart';
import 'package:todo_app/screens/tasks_screen.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
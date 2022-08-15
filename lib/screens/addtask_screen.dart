import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modals/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            TextField(
              autofocus: true,
              controller: controller,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.bottom,
              textInputAction: TextInputAction.done,
              onEditingComplete: (){
                Provider.of<TaskData>(context,listen: false).addTask(controller.text);
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent),),
              onPressed: (){
                Provider.of<TaskData>(context,listen: false).addTask(controller.text);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

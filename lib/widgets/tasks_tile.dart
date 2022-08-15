import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallback;
  final void Function() longPressCallback;

  TaskTile({required this.isChecked,required this.taskTitle,required this.checkboxCallback,required this.longPressCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        trailing: TextButton(
        child: Icon(
          Icons.remove_circle_outline,
          color: Colors.red,
        ),
        onPressed: longPressCallback,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough:null,
        ),
      ),
      leading: Checkbox(
        activeColor: Colors.redAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      )
    );
  }
}
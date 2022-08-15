import 'package:flutter/material.dart';
import 'package:todo_app/db/db_provider.dart';
import 'package:todo_app/modals/task_data.dart';
import 'package:todo_app/screens/addtask_screen.dart';
import 'package:todo_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {

  getTasks()async {
    final tasks = await DBProvider.database.getTask();
    print(tasks);
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context)=>SingleChildScrollView(
              child: Container(
                color: Color(0xFF757575),
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add,size: 40.0,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60.0,left: 30.0,right: 30.0,bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.list,color: Colors.redAccent,size: 30,)
                ),
                SizedBox(height: 10.0,),
                Text(
                  'ToDo Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),
                  )
              ),
              child: TaskList(),

              /*child: FutureBuilder(
                future: getTasks(),
                builder: (context,taskData){
                  switch(taskData.connectionState){
                    case ConnectionState.waiting:
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    case ConnectionState.done:
                      {
                        return ListView.builder(
                          itemCount: taskData.,
                          itemBuilder: (context,index){
                            String title = taskData.data[index]['task'];

                          },
                        );
                      }
                  }
                }
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_state_management/models/task_data.dart';
class TasksList extends StatefulWidget {

   List<Task> tasks = [
     Task(name: "Buy Milk"),
     Task(name: "Buy Eggs"),
     Task(name: "Buy Protein"),
     Task(name: "Buy Creatine"),
   ];
  TasksList(List<Task> tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return
        //   ListView(
        //   children: [
        //     TaskTile(isChecked:tasks[0].isDone, taskTitle: tasks[0].name),
        //     TaskTile(isChecked:tasks[1].isDone , taskTitle:tasks[1].name),
        //     TaskTile(isChecked:tasks[2].isDone, taskTitle:tasks[2].name),
        //     TaskTile(isChecked:tasks[3].isDone, taskTitle: tasks[3].name),
        //   ],
        // );
        ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return TaskTile(
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
        checkboxCallback: (bool? checkboxState) {
              setState(() {
                Provider.of<TaskData>(context).tasks[index].toggleDone();
              });
        }
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}

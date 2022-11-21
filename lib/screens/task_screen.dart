import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_state_management/models/task_data.dart';
import 'package:todoey_state_management/screens/add_task_screen.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Eggs"),
    Task(name: "Buy Protein"),
    Task(name: "Buy Creatine"),
  ];


  Widget buildBottomSheet(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 30, right: 30, bottom: 30),
                child: Column(
                  children:  [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Icons.list,
                        size: 30,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Todoey",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${Provider.of<TaskData>(context).tasks.length} Tasks  ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: TasksList(tasks),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(context: context, builder:( BuildContext context) => AddTaskScreen((newtaskTitle){
              setState(() {
                tasks.add(Task(name: newtaskTitle));
              });
              Navigator.pop(context);
            }));
          },
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
        ));
  }
}



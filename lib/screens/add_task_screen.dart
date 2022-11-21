import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
 late Function addTaskCallback;
 AddTaskScreen(this.addTaskCallback);

 late String newtaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                ),
              ),
               SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newtaskTitle = newText;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                onPressed: () {
                  addTaskCallback(newtaskTitle);
                  },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = true;
  String? taskTitle;
  Function checkboxCallback;
  TaskTile({super.key, required this.isChecked,required this.taskTitle,required this.checkboxCallback});
  // void checkboxCallback (bool? checkboxState) {
  //  // setState(() {
  //   //   isChecked = checkboxState!;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle!,style: TextStyle(decoration:isChecked? TextDecoration.lineThrough: null),),
      trailing:
      Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked, onChanged: (newValue){
          checkboxCallback(newValue);
           },
        // onChanged:toggleCheckboxState,
      ),
      // TaskCheckBox(isChecked,
      //         (bool? checkboxState) {
      //   setState(() {
      //     isChecked = checkboxState!;
      //   });
      // }
      // ),
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//
//   final bool checkboxState;
//   final Function(bool?) toggleCheckboxState;
//    const TaskCheckBox(this.checkboxState,this.toggleCheckboxState, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         activeColor: Colors.lightBlueAccent,
//         value: checkboxState,
//         onChanged:toggleCheckboxState,
//     );
//   }
// }

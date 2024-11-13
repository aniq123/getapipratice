// todo.dart
import 'package:apiwworking/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../controller/task_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

//import 'package:todolistwithgetx/controller/controller.dart';

import '../Screens/TaskTile.dart';
import '../Screens/addtask.dart';

class Todo extends StatelessWidget {
  Todo({super.key});
  final TaskController taskController = Get.put(TaskController());

  // Date format pattern for consistency
  final DateFormat dateFormat = DateFormat('hh:mm a, dd MMM yyyy');

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => Get.to(AddTask()),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(15),
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: taskController.taskList.length,
              itemBuilder: (context, index) {
                final task = taskController.taskList[index];
                return Tasktile(
                  size: size,
                  text: text,
                  time:
                      dateFormat.format(task.taskCreated), // Formatted DateTime
                  des: task.taskDescription,
                  press: () => taskController.deleteTask(task),
                );
                SizedBox(
                  height: 5,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

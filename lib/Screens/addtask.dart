// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:apiwworking/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:todolistwithgetx/controller/controller.dart';
//import 'package:todolistwithgetx/controller/task_controller.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
            Text(
              "Add New Task",
              style: text.headline5,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: taskController.textEditingController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: 'Enter Task Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: () {
                  // Adding task
                  taskController
                      .addTask(taskController.textEditingController.text);
                  Get.back(); // Go back to the previous screen
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Add Task",
                    style: text.button!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

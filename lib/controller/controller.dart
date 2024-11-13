// task_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/task.dart';

class TaskController extends GetxController {
  final RxList<Task> _taskList = <Task>[].obs;
  late TextEditingController textEditingController;

  List<Task> get taskList => _taskList;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void addTask(String taskDescription) {
    if (taskDescription.isNotEmpty) {
      DateTime time = DateTime.now();
      _taskList.add(Task(taskDescription: taskDescription, taskCreated: time));
      textEditingController.clear();
    }
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
  }
}

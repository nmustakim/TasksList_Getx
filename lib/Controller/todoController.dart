import 'dart:core';

import 'package:get/get.dart';
import 'package:todo_getx/Models/todos.dart';

class ToDoController extends GetxController {
  var todos = <ToDo>[].obs;

  void addToDo(String title, String desc, DateTime dateTime) {
    todos.add(ToDo(title: title, desc: desc, creationDate: dateTime));
  }

  void deleteToDo(index) {
    todos.removeAt(index);
  }

  void updateToDo(int index, String title, String desc) {
    todos[index] = ToDo(title: todos[index].title, desc: todos[index].desc);
  }
}

import 'dart:core';

import 'package:get/get.dart';
import 'package:todo_getx/Models/todos.dart';

class ToDoController extends GetxController {
  var todos = <ToDo>[

  ].obs;
  var foundTodo = <ToDo>[].obs;

  @override
  void onInit() {
    foundTodo.value = todos;
    super.onInit();
  }

  void runFilter(String enteredString) {
    var result = <ToDo>[];
    if (enteredString.isEmpty) {
      result = todos;
    } else {
      result = todos
          .where((element) =>
              element.title.toLowerCase().contains(enteredString.toLowerCase()))
          .toList();
    }
    foundTodo.value = result;
  }

  void addToDo(String title, String desc, DateTime dateTime) {
    todos.add(ToDo(title: title, desc: desc, creationDate: dateTime));
  }

  void deleteToDo(index) {
    todos.removeAt(index);
  }

 updateToDo(int index, String title, String desc) {
    todos[index] = ToDo(title: todos[index].title, desc: todos[index].desc);

  }
}

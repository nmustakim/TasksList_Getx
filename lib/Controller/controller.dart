import 'dart:core';

import 'package:get/get.dart';
import 'package:todo_getx/Models/todos.dart';

class Controller extends GetxController{
var todos = <ToDo> [].obs;



void addToDo (String title,String desc){
 todos.add(ToDo(title: title,desc: desc));

  }
void deleteToDo(ToDo td){
    todos.remove(td);
}

}
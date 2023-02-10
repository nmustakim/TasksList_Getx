import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/todo_home.dart';

import '../Controller/todoController.dart';

class EditToDo extends StatefulWidget {
  int index;

  EditToDo(this.index, {super.key});

  @override
  State<EditToDo> createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  final controller = Get.find<ToDoController>();
  @override
  Widget build(BuildContext context) {
    final toDoTitle =
        TextEditingController(text: controller.todos[widget.index].title);
    final toDoDesc =
        TextEditingController(text: controller.todos[widget.index].desc);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(height: 120,decoration: BoxDecoration(color:Colors.cyanAccent,borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)),),
               Padding(
                 padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                 child: Column(children: [
                   SizedBox(
                     height: 45,
                     child: TextField(
                       controller: toDoTitle,
                       decoration: InputDecoration(
                           hintText: 'Title',
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(15))),
                     ),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   TextField(
                     maxLines: 15,
                     controller: toDoDesc,
                     decoration: InputDecoration(
                         hintText: 'Description',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15))),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [
                       Expanded(
                           child: SizedBox(
                               height: 55,
                               child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                       backgroundColor:Color.fromRGBO(156, 60, 252, 30),
                                       shape: RoundedRectangleBorder(
                                           borderRadius:
                                           BorderRadius.circular(15))),
                                   onPressed: () {
                                     Get.back();
                                   },
                                   child: const Text(
                                     'Cancel',
                                     style: TextStyle(fontSize: 18),
                                   )))),
                       const SizedBox(
                         width: 50,
                       ),
                       Expanded(
                           child: SizedBox(
                               height: 55,
                               child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                       backgroundColor:Color.fromRGBO(156, 60, 252, 30),
                                       shape: RoundedRectangleBorder(
                                           borderRadius:
                                           BorderRadius.circular(15))),
                                   onPressed: () {
                                     controller.updateToDo(widget.index,
                                         toDoTitle.text, toDoDesc.text);
                                     Get.to(TodoHome());
                                   },
                                   child: const Text(
                                     'Update To Do',
                                     style: TextStyle(fontSize: 18),
                                   )))),
                     ],
                   ),
                 ],),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

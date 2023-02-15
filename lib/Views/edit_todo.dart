import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/todo_home.dart';
import '../Controller/todoController.dart';

class EditToDo extends StatelessWidget {
  final index;

 EditToDo(this.index, {super.key});

  final controller = Get.find<ToDoController>();

  @override
  Widget build(BuildContext context) {
    final toDoTitle =
        TextEditingController(text: controller.todos[index].title);

    final toDoDesc =
        TextEditingController(text: controller.todos[index].desc);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(children: [
                Container(height: 100,width:MediaQuery.of(context).size.width,decoration: BoxDecoration(color:Colors.cyanAccent,borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.navigate_before,size: 50)),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Edit Todo',style: TextStyle(fontSize: 40),),
                      ),
                      IconButton(onPressed: (){
                        controller.updateToDo(index,toDoTitle.text, toDoDesc.text);
                        Get.snackbar('Success','Todo updated successfully');
   Get.to(TodoHome());

    }, icon: Icon(Icons.check,size: 60,color: Colors.green,))
                    ],
                  ),
                ),

              ],),
             Padding(
               padding: const EdgeInsets.fromLTRB(18, 32, 18, 0),
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
                   maxLines: 18,
                   controller: toDoDesc,
                   decoration: InputDecoration(
                     focusColor: Colors.cyanAccent,
                       hintText: 'Description',
                       border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(15))),
                 ),



            ],
          ),
             )
    ]))
      ),
    );
  }
}

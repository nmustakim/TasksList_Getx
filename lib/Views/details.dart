import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/edit_todo.dart';


import '../Controller/controller.dart';
import 'home.dart';

class Details extends StatelessWidget {
int index ;

Details(this.index, {super.key});

@override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(body: SafeArea(child: Container(padding:EdgeInsets.all(16.0),child: Column(children: [
      Card(child: Container(width:600,padding:EdgeInsets.all(16),child: Text(controller.todos[index].title!,style: TextStyle(fontSize: 20),),)),
Card(child: Container(height:500,width:600,padding:EdgeInsets.all(16),child: Text(controller.todos[index].desc!,style: TextStyle(fontSize: 18),),),),
      SizedBox(height: 25,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
       Expanded(
         child: SizedBox(
           height: 60,
           child: ElevatedButton(
              onPressed: () { controller.deleteToDo(controller.todos[index]);Get.back();},
              child: const Icon(Icons.delete,size: 36,),
            ),
         ),

       ),
          SizedBox(width: 25,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
              onPressed: () => Get.to(EditToDo(index)),
              child: const Icon(Icons.edit,size: 36,),
        ),
            ),
          ),
      ],)
    ],),)
    ));
  }
}

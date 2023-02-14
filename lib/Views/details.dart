import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/edit_todo.dart';
import '../Controller/todoController.dart';

class Details extends StatelessWidget {
  int index;

  Details(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ToDoController>();
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(height: 100,decoration: BoxDecoration(color:Colors.cyanAccent,borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)),),
                Center(child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                  child: Text('Todo Details',style: TextStyle(fontSize: 40),),
                )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(onPressed:()=>Get.back(),icon: Icon(Icons.navigate_before,size:50),
                    ),
                    )
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                   child: Column(children: [

               Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                 elevation:5,
                     child: Container(
                       height: 50,
                       width: 600,
                       padding: EdgeInsets.all(16),
                       child: Text(
                         controller.todos[index].title,
                         style: TextStyle(fontSize: 20),
                       ),
                     )
               ),
               Card(
                 elevation: 5,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   child: Container(
                     height: 300,
                     width: 600,
                     padding: EdgeInsets.all(16),
                     child: Text(
                       controller.todos[index].desc,
                       style: TextStyle(fontSize: 18),
                     ),
                   ),
               ),
               SizedBox(
                   height: 25,
               ),
               Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Expanded(
                       child: SizedBox(
                         height: 60,
                         child: ElevatedButton(

                           style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),backgroundColor:Colors.cyanAccent ),
                           onPressed: () {
                             controller.deleteToDo(index);
                             Get.back();
                           },
                           child: const Icon(
                             Icons.delete,
                             size: 36,
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 50,
                     ),
                     Expanded(
                       child: SizedBox(
                         height: 60,
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),backgroundColor:Colors.cyanAccent, ),
                           onPressed: () => Get.to(EditToDo(index)),
                           child: const Icon(
                             Icons.edit,
                             size: 36,
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                   ],
               )
                   ],),
                 ),

              ],
            ),
          ),
        ));
  }
}

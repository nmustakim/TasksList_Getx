import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/todoController.dart';

class AddToDo extends StatefulWidget {
  bool? isDone;

  AddToDo({super.key, this.isDone});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  var toDoTitle = TextEditingController();
  var toDoDesc = TextEditingController();
  final controller = Get.find<ToDoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(height: 100,width:MediaQuery.of(context).size.width,decoration: const BoxDecoration(color:Colors.cyanAccent,borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)),),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.close_rounded,color: Colors.red,size: 60)),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Add Todo',style: TextStyle(fontSize: 40),),
                        ),
        IconButton(onPressed: () {controller.addToDo(
        toDoTitle.text,
        toDoDesc.text);
            Get.back();}, icon: const Icon(Icons.check,color: Colors.green,size: 60)),

                      ],
                    ),
                  ),

                ],),

                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 32,18, 0),
                  child: Column(children: [
                    SizedBox(
                      height:45,
                      child: TextField(
                        textAlign: TextAlign.center,
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
                      textAlign: TextAlign.center,
                      maxLines: 20,
                      controller: toDoDesc,
                      decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),

                  ],),
                ),

              ],
            ),
          ),
    ),
    );
  }
}

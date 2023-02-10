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
    body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 125,decoration: BoxDecoration(color:Colors.cyanAccent,borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25),)),),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32,16, 0),
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
                    maxLines: 15,
                    controller: toDoDesc,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                            height: 55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.cyanAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15))),
                                onPressed: () {
                                  controller.addToDo(
                                    toDoTitle.text,
                                    toDoDesc.text,
                                    DateTime.now(),
                                  );
                                  Get.back();
                                },
                                child: const Text('Add To Do',style: TextStyle(fontSize: 16,color: Colors.black),))
                        ),
                      ),
                      SizedBox(width: 50,),
                      Expanded(
                        child: SizedBox(
                            height: 55,
                            child: ElevatedButton(style:ElevatedButton.styleFrom( backgroundColor: Colors.cyanAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ),onPressed: ()=>Get.back(), child: Text('Cancel',style: TextStyle(fontSize: 16,color: Colors.black),))),
                      )
                    ],
                  ),
                ],),
              ),

            ],
          ),
        ),
    );
  }
}

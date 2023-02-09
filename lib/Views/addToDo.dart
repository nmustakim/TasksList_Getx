import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/controller.dart';

class AddToDo extends StatefulWidget {
bool? isDone;

AddToDo({super.key, this.isDone});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {


  var toDoTitle = TextEditingController();
  var toDoDesc = TextEditingController();
  final controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: SafeArea(
      child: SingleChildScrollView(
        child: Container(padding: const EdgeInsets.all(16),child: Column(children: [TextField(controller:toDoTitle,decoration: InputDecoration(hintText:'Title',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),),
          const SizedBox(height: 10,),
         TextField(maxLines: 15,controller:toDoDesc,decoration: InputDecoration(hintText:'Description',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: SizedBox(height:55,child: ElevatedButton(style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),onPressed: (){controller.addToDo(toDoTitle.text, toDoDesc.text,DateTime.now(),);Get.back();}, child: const Text('Add To Do')))),
            ],
          ),],),),
      ),
    ),);
  }
}

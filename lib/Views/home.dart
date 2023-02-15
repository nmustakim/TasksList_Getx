import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/todo_home.dart';

import '../Controller/todoController.dart';
class Home extends StatefulWidget {
 Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ToDoController>();
    return Scaffold(

      body:SingleChildScrollView(
        child: SizedBox(child: Column(children: [
          ClipRRect(borderRadius: const BorderRadius.only(bottomRight:Radius.circular(200),bottomLeft: Radius.circular(15)),child: Image.asset('assets/images/home.jpg',),),
          const SizedBox(height: 50,),
          const Text('Welcome',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
          const Text('Please, enter your name',style: TextStyle(fontSize: 18),),

          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 45,
              child: TextField(
                textAlign: TextAlign.center,
                controller: name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your Name....',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ),
          ElevatedButton(onPressed: (){if(name.text.isEmpty){Get.snackbar('No name!', 'Please Enter Your Name');}else{
           controller.name.value = name.text;
         Get.to(()=>TodoHome());}},style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent,foregroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), child: const Text('Let\'s Start >'),)
        ],),),
      ),
    );
  }
}

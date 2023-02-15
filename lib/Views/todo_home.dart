import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/details.dart';
import '../Controller/todoController.dart';
import 'addToDo.dart';
import 'package:intl/intl.dart';

class TodoHome extends StatefulWidget {


  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}


class _TodoHomeState extends State<TodoHome> {
  final controller = Get.find<ToDoController>();

  final search = TextEditingController();
  late String name;
@override
  void initState() {
name = controller.name.string;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor:Colors.cyanAccent,
        onPressed: () => Get.to(() => AddToDo()),
        child: const Icon(
          Icons.add_rounded,
          size: 36,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(

              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Hello,$name',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CircleAvatar(backgroundColor:Colors.cyanAccent,radius:30,child: Text(name.substring(0,1).toUpperCase(),style: TextStyle(fontSize: 18,color: Colors.black),),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: search,
                      onChanged: (v) => controller.runFilter(v),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: const Icon(Icons.search),
                          hintText: 'Title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Obx(
                    () => ListView.builder(
                      itemCount: controller.foundTodo.value.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              controller.foundTodo.value[index].title,
                            ),
                            leading: Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              checkColor: Colors.black,
                              fillColor: MaterialStateProperty.all(Colors.cyanAccent),
                              focusColor: Colors.black,

                              value: controller.foundTodo.value[index].isDone,
                              onChanged: (value) {
                                var todo = controller.todos[index];
                                todo.isDone = value!;
                                controller.todos[index] = todo;
                              },
                            ),

                              trailing: Text(DateFormat().format(controller
                                .foundTodo.value[index].creationDate!)),
                            onTap: () => Get.to(Details(index)),
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/details.dart';
import '../Controller/controller.dart';
import 'addToDo.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    final search = TextEditingController();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(()=> AddToDo()),child: const Icon(Icons.add_circle),),
        body: Container(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              TextField(controller:search,decoration: InputDecoration(suffixIcon:const Icon(Icons.search),hintText:'Title',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),),
              const SizedBox(height: 10,),
            Obx(() =>
              Expanded(
                child: ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              controller.todos[index].title,
                            ),
                            leading: Checkbox(
                                value: controller.todos[index].isDone,
                              onChanged: (value) {
                                var todo = controller.todos[index];
                                todo.isDone = value!;
                                controller.todos[index] = todo;
                                print(controller.todos[index].isDone);


                              },
                                ),
                            trailing: Text(DateFormat().format(
                                controller.todos[index].creationDate!)),
                            onTap: () => Get.to(() => Details(index)),
                          ),
                        );
                      },
                    ),
              )
              )

            ],
          ),
        ),
      ),
    );
  }
}

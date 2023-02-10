import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/details.dart';
import '../Controller/todoController.dart';
import 'addToDo.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.find<ToDoController>();
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => AddToDo()),
          child: const Icon(Icons.add_circle),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                controller: search,
                onChanged: (v) => controller.runFilter(v),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
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
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          controller.foundTodo.value[index].title,
                        ),
                        leading: Checkbox(
                          value: controller.foundTodo.value[index].isDone,
                          onChanged: (value) {
                            var todo = controller.todos[index];
                            todo.isDone = value!;
                            controller.todos[index] = todo;
                          },
                        ),
                        trailing: Text(DateFormat().format(
                            controller.foundTodo.value[index].creationDate!)),
                        onTap: () => Get.to(() => Details(index)),
                      ),
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Views/details.dart';
import '../Controller/controller.dart';
import 'addToDo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final controller = Get.find<Controller>();
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(const AddToDo()),child: const Icon(Icons.add_circle),),
        body: Container(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              TextField(controller:search,decoration: InputDecoration(suffixIcon:const Icon(Icons.search),hintText:'Title',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),),
              const SizedBox(height: 10,),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            controller.todos[index].title!,
                          ),
                          trailing: const Text('data'),
                          onTap: ()=>Get.to(Details(index)),
                        ),
                      );
                    },
                  ),
                );
              }),

            ],
          ),
        ),
      ),
    );
  }
}

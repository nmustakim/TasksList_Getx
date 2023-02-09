import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/todoController.dart';
import 'Views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ToDoController counter = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

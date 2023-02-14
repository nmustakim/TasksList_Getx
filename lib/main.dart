import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/todoController.dart';
import 'Views/home.dart';
import 'Views/todo_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
       primaryColor: Colors.cyanAccent
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

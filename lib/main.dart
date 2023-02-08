import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/controller.dart';
import 'Views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Controller counter = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


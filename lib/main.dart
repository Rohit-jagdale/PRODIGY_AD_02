import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/model/task_model.dart'; // Import Task model
import 'package:to_do_list/pages/to_do_list_page.dart';
import 'package:to_do_list/model/save_task.dart';
import 'package:to_do_list/tasks_box.dart';

Future<void> main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');

  Get.put(SaveTask());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoListPage(),
    );
  }
}

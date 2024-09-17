import 'dart:ffi';

import 'package:hive/hive.dart';

part 'task_model.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: 32) // Assign a unique typeId
class Task extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  late bool isComplete;

  Task({
    required this.title,
    required this.description,
     bool?  isComplete
  }) : isComplete = isComplete ?? false;

  void isDone(){
    isComplete = !isComplete;
  }
}

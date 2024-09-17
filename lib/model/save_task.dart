import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/model/task_model.dart';

class SaveTask extends GetxController {
  late Box<Task> taskBox;

  @override
  Future<void> onInit() async {
    super.onInit();
    taskBox = Hive.box<Task>('tasks');
    loadTasks();
  }

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void loadTasks() {
    _tasks = taskBox.values.toList(); // Load tasks from Hive
    update();  // Notify listeners
  }

  void addTask(Task task) {
    taskBox.add(task);  // Add task to Hive box
    _tasks = taskBox.values.toList(); // Update the in-memory list
    update();  // Notify listeners
  }

  void deleteTask(Task task) {
    int index = taskBox.values.toList().indexOf(task); // Find the index of the task
    if (index != -1) {
      taskBox.deleteAt(index); // Delete task from Hive box
      _tasks = taskBox.values.toList(); // Update the in-memory list
      update(); // Notify listeners
    }
  }


  // New method to update a task
  void updateTask(int index, String newTitle, String newDescription) {
    Task updatedTask = Task(title: newTitle, description: newDescription, isComplete: false);

    // Update task in the Hive box
    taskBox.putAt(index, updatedTask);

    // Refresh the in-memory task list
    _tasks = taskBox.values.toList();

    update();  // Notify listeners about the update
  }

  void checkTask(int index){
    tasks[index].isDone();
    update();
  }
}

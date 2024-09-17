import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/model/save_task.dart';
import 'package:to_do_list/model/task_model.dart';
import 'package:to_do_list/pages/to_do_list_page.dart';

class TaskDetailPage extends StatelessWidget {
  final Task task;

  TaskDetailPage({super.key, required this.task});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with task values
    titleController.text = task.title;
    descriptionController.text = task.description;

    return GetBuilder<SaveTask>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Task",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title Input Field
              TextField(
                controller: titleController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Enter Task Title",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: "Title",
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 20),

              // Description Input Field
              TextField(
                minLines: 3,
                maxLines: 5,
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter Task Description",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  labelText: "Description",
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 20),

              // Update Button
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    // Update task with new values
                    ctrl.updateTask(
                        ctrl.tasks.indexOf(task),
                        titleController.text,
                        descriptionController.text
                    );
                    // Clear the controllers and go back to the todo list page
                    titleController.clear();
                    descriptionController.clear();
                    Get.back(); // Go back to the previous page
                  } else {
                    Get.snackbar(
                      'Error',
                      'Title cannot be empty',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      borderRadius: 8,
                      margin: EdgeInsets.all(16),
                    );
                  }
                },
                child: Text("Update Task"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

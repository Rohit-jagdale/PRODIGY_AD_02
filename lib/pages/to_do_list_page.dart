import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/model/save_task.dart';
import 'package:to_do_list/pages/task_detail_page.dart';
import 'package:to_do_list/tasks_box.dart';

import 'add_task_page.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaveTask>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Todo List",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          elevation: 4,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddTaskPage());
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.teal,
        ),
        body: ctrl.tasks.isEmpty
            ? const Center(
          child: Text(
            "No tasks available!",
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
            : ListView.builder(
          itemCount: ctrl.tasks.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Get.to(TaskDetailPage(task: ctrl.tasks[index]));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    ctrl.tasks[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: ctrl.tasks[index].isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      Checkbox(
                        value: ctrl.tasks[index].isComplete,
                        onChanged: (_) {
                          ctrl.checkTask(index);
                        },
                        activeColor: Colors.teal,
                      ),
                      IconButton(
                        onPressed: () {
                          ctrl.deleteTask(ctrl.tasks[index]);
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

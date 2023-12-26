import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/models/todo_model.dart';

import '../constant.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen(
      {super.key, required this.type, required this.index, required this.task});

  final String type;
  final int index;
  final String task;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (type == 'update') {
      controller.text = task;
    }
    return Scaffold(
      backgroundColor: kLightBlueColor,
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        elevation: 0,
        title: Text(type == 'add' ? "Add Task" : "Update Task"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  labelText: "Add task"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                onButtonPressed(controller.text, index);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPinkColor),
                fixedSize: MaterialStateProperty.all(
                  const Size(100, 40),
                ),
              ),
              child: Text(type == 'add' ? "Add" : "Update"),
            ),
          ],
        ),
      ),
    );
  }

  void onButtonPressed(String task, int index) {
    if (type == 'add') {
      add(task);
    } //
    else {
      update(task, index);
    }
    controller.clear();
  }

  add(String task) async {
    var box = await Hive.openBox('todo');
    Todo todo = Todo(task);
    box.add(todo);
  }

  update(String task, int index) async {
    var box = await Hive.openBox('todo');
    Todo todo = Todo(task);
    box.putAt(index, todo);
  }
}

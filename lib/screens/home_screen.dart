import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/constant.dart';
import 'package:to_do_app/models/todo_model.dart';
import 'package:to_do_app/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueColor,
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, left: 30),
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ToDoScreen(
                type: 'add', index: -1, task: '',
              );
            },
          ));
        },
        backgroundColor: kPinkColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Hive.openBox('todo'),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return todoList();
                } //
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget todoList() {
    Box todoBox = Hive.box('todo');
    return ValueListenableBuilder(
      valueListenable: todoBox.listenable(),
      builder: (context, Box box, child) {
        if (box.values.isEmpty) {
          return const Center(
            child: Text(
              "Add task!",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        } //
        else {
          return SizedBox(
            height: 500,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todoBox.length,
              itemBuilder: (context, index) {
                final Todo todo = box.getAt(index);
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ToDoScreen(
                          type: 'update', index: index, task: todo.task,
                        );
                      },
                    ));
                  },
                  child: SizedBox(
                    height: 80,
                    child: Card(
                      color: kDarkBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.white,
                          ),
// Icon(
//   Icons.circle_outlined,
//   color: Colors.white,
// ),
                          title: Text(
                            todo.task,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

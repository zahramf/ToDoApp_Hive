import 'package:flutter/material.dart';
import 'package:to_do_app/constant.dart';
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
              return ToDoScreen(type: 'add',);
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
            SizedBox(
              height: 80,
              child: Card(
                color: kDarkBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Center(
                  child: ListTile(
                    leading:
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                    ),
                    // Icon(
                    //   Icons.circle_outlined,
                    //   color: Colors.white,
                    // ),
                    title: Text(
                      "task 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

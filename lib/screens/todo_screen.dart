import 'package:flutter/material.dart';

import '../constant.dart';

class ToDoScreen extends StatelessWidget {
   ToDoScreen({super.key});
TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueColor,
      appBar: AppBar(
        backgroundColor: kLightBlueColor,
        elevation: 0,
        title: const Text("Add Todo"),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                  ),
                  labelText: "Add task"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPinkColor),
                fixedSize: MaterialStateProperty.all(
                  const Size(100, 40),
                ),
              ),
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eandv/view/addevent_screen.dart';
import 'package:eandv/view/viewevent_screen.dart';
import 'package:eandv/view/signup_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('EandV'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SignUpScreen());
              },
              child: const Text("Signup/Login"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AddEventScreen());
              },
              child: const Text("Add Event"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ViewEventScreen());
              },
              child: const Text("View Events"),
            )
          ],
        ));
  }
}

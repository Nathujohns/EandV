import 'package:flutter/material.dart';
import 'package:eandv/screens/Volunteer/viewevent_screen.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

class VolunteerHomeScreen extends StatelessWidget {
  VolunteerHomeScreen({Key? key}) : super(key: key);

  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    controller.getUser();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('EandV'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/volunteer.png', fit: BoxFit.scaleDown),
            const SizedBox(
              height: 50,
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

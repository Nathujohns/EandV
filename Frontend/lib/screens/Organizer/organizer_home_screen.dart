import 'package:flutter/material.dart';
import 'package:eandv/screens/Organizer/addevent_screen.dart';
import 'package:eandv/screens/Volunteer/viewevent_screen.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

import '../profile.dart';

class OrganizerHomeScreen extends StatelessWidget {
  OrganizerHomeScreen({Key? key}) : super(key: key);

  final EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    controller.getUser();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
            )
          ],
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

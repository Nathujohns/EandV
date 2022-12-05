import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:eandv/screens/Volunteer/viewevent_screen.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

import '../profile.dart';

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
          title: const Text('EandV'),
        ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.deepOrange,
        //   animationDuration: Duration(milliseconds: 300),
        //   // onTap: () {},
        //   items: const [
        //     Icon(
        //       Icons.home,
        //       color: Colors.white,
        //     ),
        //     Icon(
        //       Icons.add,
        //       color: Colors.white,
        //     ),
        //     Icon(Icons.settings, color: Colors.white)
        //   ],
        // ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                                color: Colors.grey,
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.all(10),
                                child: const Center(
                                  child: Text("Events"),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:eandv/Screens/Login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:eandv/screens/Organizer/addevent_screen.dart';
import 'package:eandv/screens/Volunteer/viewevent_screen.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

import '../../Screens/Welcome/welcome_screen.dart';
import '../profile.dart';

class OrganizerHomeScreen extends StatefulWidget {
  const OrganizerHomeScreen({Key? key}) : super(key: key);

  @override
  State<OrganizerHomeScreen> createState() => _OrganizerHomeScreenState();
}

class _OrganizerHomeScreenState extends State<OrganizerHomeScreen> {
  final EventController controller = Get.put(EventController());

  int _selectedIndex = 0;
  // List<Widget> _widgetOptions = <Widget>[
  //   Profile(),
  // ];
  //
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Profile(),
    SignInScreen(),
    WelcomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Add Events',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
              child: const Text("View all Events"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: controller.allEvent.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 300.0,
                          color: Colors.transparent,
                          child: Container(
                              height: 250,
                              width: 250,
                              margin: EdgeInsets.only(left: 20),
                              // padding: EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 250,
                                      width: 400,
                                      child: Image.asset(
                                        'assets/images/volunteer.png',
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 10,
                                  // ),
                                  // Text(""),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                    "Event  :  ${controller.allEvent[index].title}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Text("data"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                    "Event Date  :  ${controller.allEvent[index].eventDate?.substring(0, 10)}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                      "Required Volunteers :" +
                                          controller.allEvent[index].members
                                              .toString(),
                                      style: const TextStyle(fontSize: 20)),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

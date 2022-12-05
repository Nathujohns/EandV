import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
                      height: 200,
                      child: ListView.builder(
                        itemCount: controller.allEvent.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          height: 300.0,
                          color: Colors.transparent,
                          child: Container(
                              height: 100,
                              width: 200,
                              margin: EdgeInsets.only(left: 20),
                              // padding: EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40.0),
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 300,
                                    child: Image.asset(
                                      'assets/images/volunteer.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text("Event   : " +
                                      controller.allEvent[index].title),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text("Date  :" +
                                      controller.allEvent[index].eventDate),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text("Numbers  :" +
                                      controller.allEvent[index].members
                                          .toString()),
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

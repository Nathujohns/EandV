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
          title: const Text('Profile'),
        ),
        body: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
        );
  }
}

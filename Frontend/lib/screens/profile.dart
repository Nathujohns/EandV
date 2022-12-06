import 'package:eandv/model/login_model.dart';
import 'package:eandv/screens/Login/login_screen.dart';
import 'package:eandv/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/event_controller.dart';
import 'Editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final EventController controller = Get.find();
  Login_model model = Login_model();

  @override
  void initState() {
    GetloginData();
    // TODO: implement initState
    super.initState();
  }

  GetloginData() async {
    model = await controller.getLogin();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "profile",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // const Text("Profile"),
              // const SizedBox(
              //   height: 20,
              // ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage("assets/${model.role}.jpeg"),
                ),
              ),
              const SizedBox(height: 20),
              Text(model.name.toString()),
              const SizedBox(height: 10),
              Text(model.email.toString()),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  // primary: kPrimaryColor,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfile()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    //   children: [
                    //   SvgPicture.asset(
                    //   icon,
                    //   color: kPrimaryColor,
                    //   width: 22,
                    // ),
                    SizedBox(width: 20),
                    Expanded(child: Text("My Account")),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  // primary: kPrimaryColor,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.notifications),
                    SizedBox(width: 20),
                    // SvgPicture.asset(
                    //   icon,
                    //   color: kPrimaryColor,
                    //   width: 22,
                    // ),
                    Expanded(child: Text("Notifications")),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  // primary: kPrimaryColor,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingScrren()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.settings),
                    SizedBox(width: 20),
                    // SvgPicture.asset(
                    //   icon,
                    //   color: kPrimaryColor,
                    //   width: 22,
                    // ),
                    Expanded(child: Text("Settings")),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  // primary: kPrimaryColor,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.help_center),
                    SizedBox(width: 20),
                    // SvgPicture.asset(
                    //   icon,
                    //   color: kPrimaryColor,
                    //   width: 22,
                    // ),
                    Expanded(child: Text("Help center")),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  // primary: kPrimaryColor,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () async {
                  SharedPreferences shared_User =
                      await SharedPreferences.getInstance();
                  String Login = '';
                  shared_User.setString('login', Login);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 20),
                    // SvgPicture.asset(
                    //   icon,
                    //   color: kPrimaryColor,
                    //   width: 22,
                    // ),
                    Expanded(child: Text("Logout")),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:eandv/model/event_model.dart';
import 'package:eandv/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/login_model.dart';
import '';

import 'dart:convert';
import 'package:get/get.dart';
// import 'package:littleswanpreschool/Controller/base_controller.dart';
// import 'package:littleswanpreschool/Helper/dialog_helper.dart';
// import 'package:littleswanpreschool/Model/Login.dart';
// import 'package:littleswanpreschool/Services/base_client.dart';
// import 'package:littleswanpreschool/View/BottomBar/BottomBarIndex.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Organizer/organizer_home_screen.dart';
import '../screens/Volunteer/volunteer_home_screen.dart';
import '../utilities/toast.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Login_model> LoginDetails = [];
  static const apiBaseUrl = 'http://localhost:3000/';

  void Login() async {
    var body = {
      "email": emailController.text,
      "password": passwordController.text,
    };
  }

  Future<void> loginUser(Map userData) async {
    // print("add event data $eventData");

    var url = Uri.parse('${apiBaseUrl}users/loginUser');

    try {
      final response = await http.post(url, body: userData);

      if (response.statusCode == 200) {
        toast("You've successfully logged in ✅");
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse['role'] == "Organizer") {
          Get.to(OrganizerHomeScreen());
        } else {
          Get.to(VolunteerHomeScreen());
        }
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  getUser() async {
    var url = Uri.parse('${apiBaseUrl}users/getUser');
    try {
      final response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        // print(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  Future<void> saveLogin(var response) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    Login_model _auth = Login_model.fromJson(jsonDecode(response));
    String login = jsonEncode(_auth);
    shared_User.setString('login', login);
  }

  Future<void> getLogin() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    String? login = shared_User.getString('login');
    if (login == '') {
      print("User not logged out");
      return;
    }
    var user = Login_model.fromJson(jsonDecode(login!));
    print(user.id);
  }

  Future<void> editUser(Map editUserData) async {
    print(editUserData);
    var url = Uri.parse('${apiBaseUrl}users/editUser');
    try {
      final response = await http.post(url, body: editUserData);

      if (response.statusCode == 200) {
        toast("User updated successfully ✅");
        Get.to(const Profile());
      } else {
        toastError(response.body);
      }
    } catch (error) {
      toastError(error.toString());
    }
  }

  Future<void> LogOut() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    String login = '';
    print(login);
    shared_User.setString('login', login);
  }
}

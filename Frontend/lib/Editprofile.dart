import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'constants.dart';
import 'controller/event_controller.dart';
import 'model/login_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        title: const Text('Edit Profile'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                hintText: model.name,
              )),
              const SizedBox(height: defaultPadding / 2),
              TextField(
                decoration: InputDecoration(
                  hintText: model.email,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Update"))
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}

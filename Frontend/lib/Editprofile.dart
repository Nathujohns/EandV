import 'package:eandv/controller/log_in_controller.dart';
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
  final _formKey = GlobalKey<FormState>();
  Login_model model = Login_model();

  Map editUserData = {"name": "", "email": ""};
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

  editUser() {
    // print("THE EDIT IS ");
    // print(editUserData.values.first);
    // print(editUserData['email']);
    // print("THE MODEL DATA IS");
    // print(model.name);
    // print(model.email);

    // // if (model.name == editUserData.values.first) {
    // //   submit = false;
    // // }

    // if (model.email != editUserData['email']) {
    //   editUserData['email'];
    //   submit = true;
    // }

    editUserData['id'] = model.id.toString();
    controller.editUser(editUserData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: model.name,
                ),
                onChanged: (value) => {editUserData['name'] = value},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Event title required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              TextFormField(
                decoration: InputDecoration(
                  hintText: model.email,
                ),
                onChanged: (value) => {editUserData['email'] = value},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Event email required';
                  }
                  editUserData['email'] = value;
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: editUser, child: const Text("Update"))
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}

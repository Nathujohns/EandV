import 'package:flutter/material.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  Map userData = {"email": "", "password": ""};

  EventController controller = Get.put(EventController());

  loginUser() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      controller.loginUser(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User SignIn'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                onSaved: (value) {
                  userData['email'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                onSaved: (value) {
                  userData['password'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: loginUser, child: const Text("SUBMIT"))
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}

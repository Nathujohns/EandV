import 'package:flutter/material.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:eandv/view/signin_screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  Map userData = {"cpr": "", "name": "", "email": "", "password": ""};

  EventController controller = Get.put(EventController());

  addUser() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      controller.addUser(userData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User SignUp/Login'),
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
                  label: Text('CPR'),
                ),
                onSaved: (value) {
                  userData['cpr'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'CPR is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Full Name'),
                ),
                onSaved: (value) {
                  userData['name'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full name is required';
                  }
                  return null;
                },
              ),
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
              ElevatedButton(onPressed: addUser, child: const Text("SUBMIT")),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                  );
                },
                child: const Text(
                  'Already have an account? Click here to login',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

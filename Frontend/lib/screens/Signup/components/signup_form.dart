import 'package:eandv/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:eandv/utilities/fieldvalidations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {
              userData['cpr'] = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Cpr is required';
              }
              if (value.isNotEmpty) {
                return isNumeric(value) ? null : "Invalid CPR";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your cpr",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.card_membership_sharp),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {
              userData['name'] = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'FullName is required';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your fullname",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {
              userData['email'] = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              if (value.isNotEmpty) {
                return value.isValidEmail() ? null : "Invalid email";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (value) {
              userData['password'] = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          const SizedBox(height: defaultPadding / 2),

          Hero(
            tag: "signup_btn",
            child: ElevatedButton(
              onPressed: addUser,
              child: const Text("SIGNUP"),
            ),
          ),

          // ElevatedButton(onPressed: addUser, child: const Text("SIGN UP")),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

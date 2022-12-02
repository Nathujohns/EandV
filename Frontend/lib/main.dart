import 'package:flutter/material.dart';
import 'package:eandv/view/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo, accentColor: Colors.amberAccent,
      ),
      home: const HomeScreen(),
    );
  }
}

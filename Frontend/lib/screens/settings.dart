import 'package:flutter/material.dart';

class SettingScrren extends StatefulWidget {
  const SettingScrren({Key? key}) : super(key: key);

  @override
  State<SettingScrren> createState() => _SettingScrrenState();
}

class _SettingScrrenState extends State<SettingScrren> {
  @override
  bool _iconbool = false;

  IconData _iconLight = Icons.wb_sunny;
  IconData _iconDark = Icons.nights_stay;

  ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light);
  ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconbool ? _darkTheme : _lightTheme,
        home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            elevation: 0.0,
            // titleSpacing: 10.0,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
            title: Text("Settings"),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Set Light theme"),
                SizedBox(
                  width: 160,
                  height: 100,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _iconbool = !_iconbool;
                      });
                    },
                    icon: Icon(_iconbool ? _iconDark : _iconLight)),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

Future<bool?> toast(String message) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: kPrimaryColor,
      textColor: Colors.white,
      fontSize: 20.0);
}

Future<bool?> toastError(String message) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 20.0);
}

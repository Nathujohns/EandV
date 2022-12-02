import 'dart:convert';
import 'package:eandv/model/event_model.dart';
import 'package:eandv/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EventController extends GetxController {
  static const apiBaseUrl = 'http://localhost:3000/api/';

  List<EventModel> allEvent = [];

  Future<void> addEvent(Map eventData) async {
    // print("add event data $eventData");

    var url = Uri.parse(apiBaseUrl + 'addevent');

    try {
      final response = await http.post(url, body: eventData);
      if (response.statusCode == 200) {
        // print(json.decode(response.body));

        var r = json.decode(response.body);
        // print(r['code']);
        Get.back();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> addUser(Map userData) async {
    // print("add event data $eventData");

    var url = Uri.parse(apiBaseUrl + 'addUser');

    try {
      final response = await http.post(url, body: userData);
      if (response.statusCode == 200) {
        // print(json.decode(response.body));

        var r = json.decode(response.body);
        // print(r['code']);
        Get.back();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> loginUser(Map userData) async {
    // print("add event data $eventData");

    var url = Uri.parse(apiBaseUrl + 'loginUser');

    try {
      final response = await http.post(url, body: userData);
      if (response.statusCode == 200) {
        Get.to(const HomeScreen());
      }
    } catch (error) {
      print(error);
    }
  }

  getEvent() async {
    allEvent = [];
    var url = Uri.parse(apiBaseUrl + 'getEvent');
    List<EventModel> helperList = [];
    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        var eventResponse = json.decode(response.body);
        // print("event response is  $eventResponse");

        eventResponse['eventData'].forEach((result) => {
              helperList.add(EventModel(
                  title: result['title'],
                  description: result['description'],
                  eventDate: result['eventDate']))
            });
      }
      allEvent.addAll(helperList);
      update();
    } catch (error) {
      print(error);
    }
  }
}

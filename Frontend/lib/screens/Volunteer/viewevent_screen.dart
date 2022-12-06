import 'package:eandv/model/event_model.dart';
import 'package:eandv/screens/Login/login_screen.dart';
import 'package:eandv/screens/Organizer/addevent_screen.dart';
import 'package:eandv/screens/Organizer/editevent_screen.dart';
import 'package:eandv/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';

class ViewEventScreen extends StatelessWidget {
  ViewEventScreen({Key? key}) : super(key: key);

  final EventController controller = Get.put(EventController());
  // EventModel model = EventModel();

  // signOut() async {
  //   await auth.signOut();
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    controller.getEvent();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
      ),
      body: GetBuilder<EventController>(
        builder: (controller) => controller.allEvent.isEmpty
            ? const Center(
                child: Text('😔 NO DATA FOUND (: 😔'),
              )
            : ListView.builder(
                itemCount: controller.allEvent.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditEventScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const Text("Event Details"),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          "Event Title :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        controller.allEvent[index].title
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          "Event Description :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          controller.allEvent[index].description
                                              .toString(),
                                          // controller.allEvent[index].description,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          "Required Volunteers :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        controller.allEvent[index].members
                                            .toString(),
                                        // controller.allEvent[index].members.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Flexible(
                                        child: Text(
                                          "Event Date :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        controller.allEvent[index].eventDate
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Image.network(
                                              // model.image.toString(),
                                              controller.allEvent[index].image
                                                  .toString(),
                                              fit: BoxFit.fill)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

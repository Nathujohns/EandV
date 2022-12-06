import 'package:eandv/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:eandv/controller/event_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import 'package:eandv/utilities/fieldvalidations.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({Key? key}) : super(key: key);

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final EventController controller = Get.find();
  EventModel model = EventModel();

  Map editEventData = {
    "title": "",
    "description": "",
    // // "status": "",
    // // "organizerId": "",
    // // "image": "",
    "members": "",
    // "eventDate": ""
  };

  @override
  void initState() {
    GetEventData();
    // TODO: implement initState
    super.initState();
  }

  // EventController controller = Get.put(EventController());

  editEvent() {
    editEventData['id'] = model.id.toString();
    controller.editEvent(editEventData);
  }

  deleteEvent() {
    controller.deleteEvent(model.id.toString());
  }

  GetEventData() async {
    model = await controller.getEvents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Events'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: model.title.toString(),
                ),
                onChanged: (value) {
                  editEventData['title'] = value;
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              TextFormField(
                decoration: InputDecoration(
                  hintText: model.description.toString(),
                ),
                onChanged: (value) {
                  editEventData['description'] = value;
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              TextFormField(
                decoration: InputDecoration(
                  hintText: model.members.toString(),
                ),
                onChanged: (value) {
                  editEventData['members'] = value;
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: model.eventDate.toString(),
              //   ),
              //   onSaved: (value) {
              //     editEventData['eventDate'] = value;
              //   },
              // ),
              const SizedBox(height: defaultPadding / 2),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: editEvent, child: const Text("UPDATE EVENT")),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: deleteEvent,
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
                child: const Text('DELETE EVENT'),
              ), // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}

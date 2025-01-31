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
  final _formKey = GlobalKey<FormState>();
  Map eventData = {
    "title": "",
    "description": ""
    // // "status": "",
    // // "organizerId": "",
    // // "image": "",
    // "members": "",
    // "eventDate": ""
  };

  EventController controller = Get.put(EventController());

  editEvent() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      controller.addEvent(eventData);
    }
  }

  deleteEvent() {
    controller.deleteEvent('46');
  }

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Event'),
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
                  label: Text('Event Title'),
                ),
                onSaved: (value) {
                  eventData['title'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Event title required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding / 2),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Event Description'),
                ),
                onSaved: (value) {
                  eventData['description'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Event description required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding / 2),

              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text('Required Volunteers'),
                ),
                onSaved: (value) {
                  eventData['members'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required volunteers is required';
                  }
                  if (value.isNotEmpty) {
                    return isNumeric(value) ? null : "Invalid Number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: defaultPadding / 2),

              TextFormField(
                controller:
                    dateController, //editing controller of this TextField
                decoration: const InputDecoration(
                    // icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly: true, // when true user cannot edit tex
                onTap: () async {
                  //when click we have to show the datepicker
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(
                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    print(
                        formattedDate); //formatted date output using intl package =>  2022-07-04
                    //You can format date as per your need

                    setState(() {
                      dateController.text = eventData['eventDate'] =
                          formattedDate; //set formatted date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                validator: (pickedDate) {
                  if (pickedDate == null || pickedDate.isEmpty) {
                    return 'Event date is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: editEvent, child: const Text("UPDATE EVENT")),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                child: const Text('DELETE EVENT'),
                onPressed: deleteEvent,
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),

              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}

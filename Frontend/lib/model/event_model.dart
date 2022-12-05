import 'package:intl/intl.dart';

class EventModel {
  final String title;
  final String description;
  final String eventDate;
  // final int organizerId;
  final int members;

  EventModel(
      {required this.title,
      required this.description,
      required this.eventDate,
      // required this.organizerId,
      required this.members});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        title: json['title'],
        description: json['description'],
        eventDate: DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(json['eventDate'].toString())),
        // organizerId: json['organizerId'],
        members: json['members']);
  }
}

import 'package:intl/intl.dart';

class EventModel {
  final int id;
  final String title;
  final String description;
  final String eventDate;
  // final int organizerId;
  final int members;
  final String image;

  EventModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.eventDate,
      // required this.organizerId,
      required this.members,
      required this.image});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        eventDate: DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(json['eventDate'].toString())),
        // organizerId: json['organizerId'],
        members: json['members'],
        image: json['image']);
  }
}

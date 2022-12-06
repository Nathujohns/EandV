// import 'package:intl/intl.dart';

// class EventModel {
//   int? nullableInterger;
//   String title;
//   String description;
//   String eventDate;
//   // final int organizerId;
//   int? nullableIntergers;
//   String image;

//   var id;

//   var members;

//   EventModel(
//       {required this.id,
//       required this.title,
//       required this.description,
//       required this.eventDate,
//       // required this.organizerId,
//       required this.members,
//       required this.image});

//   factory EventModel.fromJson(Map<String, dynamic> json) {
//     return EventModel(
//         id: json['id'],
//         title: json['title'],
//         description: json['description'],
//         eventDate: DateFormat('dd-MM-yyyy')
//             .format(DateTime.parse(json['eventDate'].toString())),
//         // organizerId: json['organizerId'],
//         members: json['members'],
//         image: json['image']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['eventDate'] = this.eventDate;
//     data['members'] = this.members;
//     return data;
//   }
// }

import 'package:intl/intl.dart';

class EventModel {
  int? id;
  String? title;
  String? description;
  // String? status;
  // int? organizerId;
  String? image;
  int? members;
  String? eventDate;
  String? createdAt;
  String? updatedAt;

  EventModel(
      {this.id,
      this.title,
      this.description,
      // this.status,
      // this.organizerId,
      this.image,
      this.members,
      this.eventDate,
      this.createdAt,
      this.updatedAt});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    // status = json['status'];
    // organizerId = json['organizerId'];
    image = json['image'];
    members = json['members'];
    eventDate = json['eventDate'];
    // organizerId: json['organizerId']
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    // data['status'] = this.status;
    // data['organizerId'] = this.organizerId;
    data['image'] = this.image;
    data['members'] = this.members;
    data['eventDate'] = this.eventDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

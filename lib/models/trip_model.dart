import 'package:first_project/models/activity_model.dart';
// import 'package:flutter/cupertino.dart';

// class Trip {
//   String? id;
//   String? city;
//   List<Activity> activities;  // liste des ids des activités
//   DateTime date;   // nombre de millisecondes ecouler depuis 1970
//   Trip({
//     this.city, 
//     required this.activities,
//     required this.date,
//   });

//   Trip.fromJson(Map<String, dynamic> json):
//     id = json['_id'],
//     city = json['city'],
//     date = DateTime.parse(json['date']),
//     activities = (json['activities'] as List).map((activityJson) => Activity.fromJson(activityJson)).toList();

//   Map<String, dynamic> toJson() {
//     return {
//       '_id':id,
//       'city':city,
//       'date':date.toIso8601String(), // convertit une date en chaine
//       'activities': activities.map((activity) => activity.toJson()).toList(),
//     };
//   }
// }

class Trip {
  String? id;
  String city;
  List<Activity> activities;
  DateTime? date;
  Trip({
    this.id,
    required this.city,
    required this.activities,
    this.date,
  });

  Trip.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        city = json['city'],
        date = DateTime.parse(json['date']),
        activities = (json['activities'] as List)
            .map(
              (activityJson) => Activity.fromJson(activityJson),
        )
            .toList();

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        '_id': id,
        'city': city,
        'date': date!.toIso8601String(),
        'activities': activities
            .map(
              (activity) => activity.toJson(),
        )
            .toList()
      };
    } else {
      return {
        'city': city,
        'date': date!.toIso8601String(),
        'activities': activities
            .map(
              (activity) => activity.toJson(),
        )
            .toList(),
      };
    }
  }
}

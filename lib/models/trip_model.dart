import 'package:first_project/models/activity_model.dart';
import 'package:flutter/cupertino.dart';

class Trip {
  String id;
  String? city;
  List<Activity> activities;  // liste des ids des activités
  DateTime date;   // nombre de millisecondes ecouler depuis 1970
  Trip({
    this.city, 
    required this.activities,
    required this.date,
    String? id,
  }) : id = id ?? UniqueKey().toString();
}

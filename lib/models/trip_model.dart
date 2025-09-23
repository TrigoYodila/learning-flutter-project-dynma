import 'package:first_project/models/activity_model.dart';

class Trip {
  String city;
  List<Activity> activities;  // liste des ids des activités
  DateTime date;   // nombre de millisecondes ecouler depuis 1970
  Trip({
    required this.city, 
    required this.activities,
    required this.date
  });
}

class Trip {
  String city;
  List<String> activities;  // liste des ids des activités
  DateTime date;   // nombre de millisecondes ecouler depuis 1970
  Trip({
    required this.city, 
    required this.activities,
    required this.date
  });
}

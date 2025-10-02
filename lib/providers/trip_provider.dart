import 'dart:collection';

import 'package:first_project/models/activity_model.dart';
import 'package:first_project/models/trip_model.dart';
import 'package:flutter/foundation.dart';

class TripProvider with ChangeNotifier {

  final List<Trip> _trips = [];

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  void addTrip(Trip trip) {
    _trips.add(trip);  // notifier tous les éléments qui ecoutent le provider.
    notifyListeners();  // les widgets qui ecoutent seront rebuild quand il y'a une mise à jour
  }

  Trip getById(String tripId){
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}
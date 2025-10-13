import 'dart:collection';
import 'package:first_project/models/activity_model.dart';
import 'package:first_project/models/trip_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class TripProvider with ChangeNotifier {
  
  final String host = 'http://10.0.2.2:5000';
  List<Trip> _trips = [];
  bool isLoading = false;


  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  Future<void> addTrip(Trip trip) async {
    try {
       final url = Uri.parse('$host/api/trip');
       http.Response response = await http.post(url, body : json.encode(trip.toJson()), headers: {
        'Content-type' : 'application/json'
       });
       if(response.statusCode == 200) {
        _trips.add(Trip.fromJson(json.decode(response.body))); 
         notifyListeners();
       }
    } catch (e) {
      rethrow;
    }
  }

  Trip getById(String tripId){
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;
      final url = Uri.parse('$host/api/trips');
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        _trips = (json.decode(response.body) as List).map((tripJson) => Trip.fromJson(tripJson)).toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

   Future<void> updateTrip(Trip trip, String activityId) async {
   
    try {
       Activity activity = trip.activities.firstWhere((activity) => activity.id == activityId);
       activity.status = ActivityStatus.done;

       final url = Uri.parse('$host/api/trip');
       http.Response response = await http.put(url, body : json.encode(trip.toJson()), headers: {
        'Content-type' : 'application/json'
       });
        if (response.statusCode != 200) {
        activity.status = ActivityStatus.ongoing;
        throw const HttpException('error');
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

}

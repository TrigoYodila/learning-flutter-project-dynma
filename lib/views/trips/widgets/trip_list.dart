import 'package:first_project/models/trip_model.dart';
import 'package:first_project/views/trip/trip_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;
  
  const TripList({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, i){
        var trip = trips[i];
        return ListTile(
          title: Text(trip.city as String),
          subtitle: trip.date != null ? Text(DateFormat("d/M/y").format(trip.date)) : null,
          trailing: Icon(Icons.info),
          onTap: (){
            Navigator.pushNamed(context, TripView.routeName, arguments: {
              'tripId':trip.id,
              'cityName':trip.city
            });
          },
        );
      },
    );
  }
}
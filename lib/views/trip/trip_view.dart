import 'package:first_project/models/city_model.dart';
import 'package:first_project/models/trip_model.dart';
import 'package:first_project/views/trip/widgets/trip_activities.dart';
import 'package:first_project/views/trip/widgets/trip_city_bar.dart';
import 'package:flutter/material.dart';

class TripView extends StatefulWidget {
  static const String routeName = '/trip';
  final Trip trip;
  final City city;

  const TripView({super.key, required this.city, required this.trip});

  @override
  State<TripView> createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TripCityBar(city: widget.city),
            TripActivities(activities:widget.trip.activities),
          ],
        ),
      ),
    );
  }
}
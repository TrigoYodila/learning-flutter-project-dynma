import 'package:first_project/models/trip_model.dart';
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/providers/trip_provider.dart';
import 'package:first_project/views/trip/widgets/trip_activities.dart';
import 'package:first_project/views/trip/widgets/trip_city_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TripView extends StatelessWidget {
  static const String routeName = '/trip';

  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String cityName = args['cityName'] as String;
    final String tripId   = args['tripId'] as String;

    final city = Provider.of<CityProvider>(context).getCityByName(cityName);
    final Trip trip = Provider.of<TripProvider>(context).getById(tripId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TripCityBar(city: city),
            TripActivities(activities:trip.activities),
          ],
        ),
      ),
    );
  }
}
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/views/trip/widgets/trip_activities.dart';
import 'package:first_project/views/trip/widgets/trip_city_bar.dart';
import 'package:first_project/views/trip/widgets/trip_weather.dart';
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

    final city = Provider.of<CityProvider>(context, listen: false).getCityByName(cityName);  // false pour ne pas entrainer de

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TripCityBar(city: city),
            TripWeather(cityName:cityName,),
            TripActivities(
              tripId:tripId
            ),
          ],
        ),
      ),
    );
  }
}
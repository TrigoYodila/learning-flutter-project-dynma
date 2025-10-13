
// import './widgets/data.dart';
import 'package:first_project/models/city_model.dart';
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/providers/trip_provider.dart';
import 'package:first_project/views/404/not_found.dart';
import 'package:first_project/views/city/widgets/city.dart';
import 'package:first_project/views/trip/trip_view.dart';
import 'package:first_project/views/trips/trips_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'views/home/home.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {

  const DymaTrip({super.key});

  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {

  // crée un objet de la classe CityProvider
  final CityProvider cityProvider = CityProvider();

  @override
  // void initState() {
  //   // appel de la methode fetchData pour recuperer les données
  //   cityProvider.fetchData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        // ChangeNotifierProvider.value(value: cityProvider),
        ChangeNotifierProvider(create: (context) => CityProvider()..fetchData()),
        ChangeNotifierProvider(create: (context) => TripProvider()..fetchData()),
      ],
      child: ChangeNotifierProvider(
        create: (context){},
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>Home(),
          CityView.routeName : (_) => CityView(),
          TripsView.routeName : (_) => TripsView(),
          TripView.routeName : (_) => TripView()
        },
        onUnknownRoute: (_) => MaterialPageRoute(
          builder: (_) => const NotFound(),
        ),
      ),
      ),
    );
  }
}

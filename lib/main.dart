
// import './widgets/data.dart';
import 'package:first_project/models/city_model.dart';
import 'package:first_project/models/trip_model.dart';
import 'package:first_project/views/404/not_found.dart';
import 'package:first_project/views/city/widgets/city.dart';
import 'package:first_project/views/trips/trips_view.dart';
import 'package:flutter/material.dart';
import 'views/home/home.dart';
import './data/data.dart' as data;

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;

  DymaTrip({super.key});

  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  // This widget is the root of your application.
  List<Trip> trips = [
    Trip(city: 'Paris', activities: [], date: DateTime.now().add(Duration(days: 1))),
    Trip(city: 'Lyon', activities: [], date: DateTime.now().add(Duration(days: 2))),
    Trip(city: 'Nice', activities: [], date: DateTime.now().subtract(Duration(days: 1)))
  ];

  void addTrip(Trip trip){
    setState(() {
      trips.add(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     titleTextStyle: TextStyle(fontSize: 30)
      //   ),
      //   primarySwatch: Colors.red,
      //   textTheme: TextTheme(
      //     bodySmall: TextStyle(color: Colors.green)
      //   )
      // ),
      debugShowCheckedModeBanner: false,
      // home: Home(),
      routes: {
        // '/city':(context) => CityView()
        '/':(context){
          return Home(cities:widget.cities);
        }
      },
      onGenerateRoute: (settings) {

        switch (settings.name){
          case CityView.routeName : {
              return MaterialPageRoute(
                builder: (context){
                  final city = settings.arguments;
                  return CityView(city: city as City, addTrip:addTrip);
                }
              );
          }

          case TripsView.routeName : {
             return MaterialPageRoute(
                builder: (context){
                  // final city = settings.arguments;
                  return TripsView(trips:trips);
                }
              );
          }
        }


        return null;
      },
      onUnknownRoute:(settings){
        return MaterialPageRoute(builder: (context){
          return NotFound();
        });
      },
      // home: Data(child: City()),
      // home:CityView(),
    );
  }
}

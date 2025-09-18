
// import './widgets/data.dart';
import 'package:first_project/models/city_model.dart';
import 'package:first_project/views/404/not_found.dart';
import 'package:first_project/views/city/widgets/city.dart';
import 'package:flutter/material.dart';
import 'views/home/home.dart';

void main() {
  runApp(const DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});

  // This widget is the root of your application.
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
      home: Home(),
      routes: {
        // '/city':(context) => CityView()
      },
      onGenerateRoute: (settings) {
        if (settings.name == CityView.routeName) {
          final city = settings.arguments;
          return MaterialPageRoute(
            builder: (context){
              return CityView(city: city as City);
            }
          );
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

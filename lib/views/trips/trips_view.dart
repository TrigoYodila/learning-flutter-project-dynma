import 'package:first_project/models/trip_model.dart';
import 'package:first_project/providers/trip_provider.dart';
import 'package:first_project/views/trips/widgets/trip_list.dart';
import 'package:first_project/widgetts/dyma_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsView extends StatelessWidget {

   static const String routeName = '/trips';

   const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Trip> trips = Provider.of<TripProvider>(context).trips;
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
        bottom: const TabBar(tabs: <Widget>[
          Tab(text: 'A venir'),
          Tab(text: 'Passés')
        ]),
      ),
      drawer: DymaDrawer(),
      body: TabBarView(children: <Widget>[
        TripList(trips: trips.where((trip) => DateTime.now().isBefore(trip.date)).toList()),
        TripList(trips: trips.where((trip) => DateTime.now().isAfter(trip.date)).toList())
      ]
      )),
    ); 
  }
}
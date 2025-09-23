import 'package:first_project/models/trip_model.dart';
import 'package:first_project/views/trips/widgets/trip_list.dart';
import 'package:first_project/widgetts/dyma_drawer.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';
  final List<Trip> trips;
 
  const TripsView({super.key, required this.trips});

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
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
        TripList(trips: widget.trips.where((trip) => DateTime.now().isBefore(trip.date)).toList()),
        TripList(trips: widget.trips.where((trip) => DateTime.now().isAfter(trip.date)).toList())
      ]
      )),
    ); 
  }
}
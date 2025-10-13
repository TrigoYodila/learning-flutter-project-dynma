import 'package:first_project/providers/trip_provider.dart';
import 'package:first_project/views/trips/widgets/trip_list.dart';
import 'package:first_project/widgetts/dyma_drawer.dart';
import 'package:first_project/widgetts/dyma_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsView extends StatelessWidget {

   static const String routeName = '/trips';

   const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    TripProvider tripProvider = Provider.of<TripProvider>(context);
    print(tripProvider.trips);
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
      body: tripProvider.isLoading != true ? tripProvider.trips.isNotEmpty ? 
        TabBarView(children: <Widget>[
        TripList(trips: tripProvider.trips.where((trip) => DateTime.now().isBefore(trip.date)).toList()),
        TripList(trips: tripProvider.trips.where((trip) => DateTime.now().isAfter(trip.date)).toList())
      ]
      ) : Container(alignment: Alignment.center, child: Text('Acun voyage pour le moment'),) : DymaLoader()) ,
    ); 
  }
}
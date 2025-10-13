import 'package:first_project/models/activity_model.dart';
import 'package:first_project/models/trip_model.dart';
import 'package:first_project/providers/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripActivityList extends StatelessWidget {

  final String tripId;
  final ActivityStatus filter;

  const TripActivityList({super.key, required this.tripId, required this.filter});

  @override
  Widget build(BuildContext context) {

    return  Consumer<TripProvider>(builder: (context, tripProvider, child){
      
    final Trip trip = Provider.of<TripProvider>(context).getById(tripId);
    final List<Activity> activities = trip.activities.where((activity)=> activity.status == filter).toList();

      return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i){
        Activity activity = activities[i];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: filter == ActivityStatus.ongoing ? Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.greenAccent,),
              child: Icon(Icons.check,size: 30,color: Colors.white,),
            ),
            key: ValueKey(activity.id), 
            child: Card(
              child: ListTile(
                title: Text(activity.name),
              ),
            ),
            onDismissed: (_){
              // print('dismiss');
              Provider.of<TripProvider>(context, listen: false).updateTrip(trip, activity.id);
            },
          ) : Card(
            child: ListTile(
              title: Text(activity.name),
            ),
          ),
        );
    });
      }
    );
  }
}
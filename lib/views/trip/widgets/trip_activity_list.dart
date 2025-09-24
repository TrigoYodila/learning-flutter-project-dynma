import 'package:first_project/models/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {

  final List<Activity> activities;

  const TripActivityList({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i){
        Activity activity = activities[i];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Dismissible(
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
              print('dismiss');
            },
          ),
        );
      }
    );
  }
}
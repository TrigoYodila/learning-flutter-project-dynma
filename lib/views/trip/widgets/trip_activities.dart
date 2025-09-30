import 'package:first_project/models/activity_model.dart';
import '../widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;
  
  const TripActivities({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2, 
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                labelColor: Colors.white,
                tabs: <Widget>[
                  Tab(text: 'En cours'),
                  Tab(text: 'Terminé',)
                ]),
            ),
              SizedBox(
                height: 600,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    TripActivityList(activities: activities.where((activity) => activity.status == ActivityStatus.ongoing).toList(),
                    filter: ActivityStatus.ongoing,),
                    TripActivityList(activities: activities.where((activity) => activity.status == ActivityStatus.done).toList(),
                    filter: ActivityStatus.ongoing,)
                  ]
                ),
              )
          ],
        ),
      );
  }
}
import 'package:first_project/models/activity_model.dart';
import '../widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {

  final String tripId;
  
  const TripActivities({super.key, required this.tripId});

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
                    TripActivityList(
                    tripId:tripId,
                    filter: ActivityStatus.ongoing
                    ),
                    TripActivityList(
                     tripId:tripId,
                     filter: ActivityStatus.ongoing
                    )
                  ]
                ),
              )
          ],
        ),
      );
  }
}
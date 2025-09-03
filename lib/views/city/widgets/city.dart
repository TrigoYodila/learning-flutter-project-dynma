import 'package:first_project/views/city/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/data.dart' as data;
import '../../../models/activity.model.dart';
import '../../../models/trip.model.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {

  Trip myTrip = Trip(city: 'Paris' , activities: [], date: DateTime.now() );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        // child: ListView(
        //   children: widget.activities.map((activity){
        //     return ActivityCard(activity: activity);
        //   }).toList()
        // ),
        // child: ListView.builder(
        //   itemBuilder: (context, index){
        //     return ActivityCard(
        //       activity: widget.activities[index]
        //     );
        //   },
        //   itemCount: widget.activities.length,
        // ),
        // child: ListView.separated(
        //   itemBuilder: (context, index) {
        //     return ActivityCard(
        //       activity: widget.activities[index]);
        //   },
        //   separatorBuilder: (context, index){
        //     return SizedBox(
        //       height: 1,
        //     );
        //   },
        //   itemCount: widget.activities.length,
        // ),
        // child: GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //   itemBuilder: (context, index) {
        //     return ActivityCard(
        //       activity: widget.activities[index]);
        //   },
        //   itemCount: widget.activities.length,
        // ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(DateFormat('d/M/y').format(myTrip.date))
                      ),
                      ElevatedButton(onPressed: ()=>{}, child: Text('Sélectionnez une date'))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: widget.activities.map((activity) {
                  return ActivityCard(activity: activity);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

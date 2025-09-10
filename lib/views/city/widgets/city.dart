import 'package:first_project/views/city/widgets/trip_activity_list.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart' as data;

import '../widgets/activity_list.dart';
import '../../../models/activity.model.dart';
import '../../../models/trip.model.dart';
import '../widgets/trip_overview.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip trip;
  late int index;

  @override // 1. Initialisation
  void initState() {
    super.initState();
    index = 0;
    trip = Trip(city: 'Paris', activities: [], date: DateTime.now());
    print('initState appelé');
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => trip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          trip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      trip.activities.contains(id)
          ? trip.activities.remove(id)
          : trip.activities.add(id);
    });
  }

  void deleteTripActivity(String id){
    setState(() {
      trip.activities.remove(id);
    });
  }

  // @override   // 3. Mise à jour des dépendances
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //    print('didChangeDependencies appelé');
  //     // Appelé après initState et quand les dépendances changent
  // }

  // @override
  // void didUpdateWidget(City oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   print('didUpdateWidget appelé');
  //    // Appelé quand le widget parent est reconstruit
  // }

  // 5. Nettoyage
  // @override
  // void dispose() {
  //   print('dispose appelé');
  //   // Nettoyage des ressources
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Paris'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
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
            TripOverview(setDate: setDate, myTrip: trip),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: trip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                    activities:tripActivities,
                    deleteTripActivity:deleteTripActivity
                  ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Decouverte'),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activités',
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}

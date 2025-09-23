import 'package:first_project/models/city_model.dart';
import 'package:first_project/views/city/widgets/trip_activity_list.dart';
import 'package:first_project/views/home/home.dart';
import '../../../widgetts/dyma_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/activity_list.dart';
import '../../../models/activity_model.dart';
import '../../../models/trip_model.dart';
import '../widgets/trip_overview.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';

  final City city;
  final Function addTrip;

  List<Activity> get activities {
    return city.activities;
  }

  showContext({required BuildContext context, required List<Widget> children}) {
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(children: children);
    }
  }

  const CityView({super.key, required this.city, required this.addTrip});

  @override
  State<CityView> createState() => _CityState();
}

class _CityState extends State<CityView> with WidgetsBindingObserver {
  late Trip trip;
  late int index;
  // late List<Activity> activities;

  @override // 1. Initialisation
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    index = 0;
    trip = Trip(city: 'Paris', activities: [], date: DateTime.now());
    // print('initState appelé');
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // on accède au context herité
  //   activities = Data.of(context).activities;

  // }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => trip.activities.contains(activity.id))
        .toList();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // pour la gestion des etats de l'app
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  void dispose() {
    super.dispose();
    // retirer le observer
    WidgetsBinding.instance.removeObserver(this);
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

  void deleteTripActivity(String id) {
    setState(() {
      trip.activities.remove(id);
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Voulez vous sauvegarder ?'),
          contentPadding: EdgeInsets.all(20),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(onPressed: () {
                  Navigator.pop(context, 'cancel');
                }, child: Text('Annuler')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                     Navigator.pop(context, 'save');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // couleur de fond du bouton
                    foregroundColor:
                        Colors.white, // couleur du texte et de l’icône
                  ),
                  child: Text('Sauvegarder'),
                ),
              ],
            ),
          ],
        );
      },
    );

    if(result == 'save'){
      widget.addTrip(trip);
       Navigator.pushNamed(context, Home.routeName);
    }

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

  double get amount {
    return trip.activities.fold(0.0, (prev, element) {
      var activity = widget.activities.firstWhere(
        (activity) => activity.id == element,
      );
      return prev + activity.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final City city = ModalRoute.of(context)!.settings.arguments as City;
    return Scaffold(
      appBar: AppBar(
        title: Text('Organisation du voyage'),
      ),
      drawer: DymaDrawer(),
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
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              setDate: setDate,
              myTrip: trip,
              cityName: widget.city.name,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: trip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: Icon(Icons.forward),
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

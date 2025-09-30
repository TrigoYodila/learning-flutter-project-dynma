import 'package:first_project/models/city_model.dart';
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/providers/trip_provider.dart';
import 'package:first_project/views/city/widgets/trip_activity_list.dart';
import 'package:first_project/views/home/home.dart';
import 'package:provider/provider.dart';
import '../../../widgetts/dyma_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/activity_list.dart';
import '../../../models/activity_model.dart';
import '../../../models/trip_model.dart';
import '../widgets/trip_overview.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';

  const CityView({super.key});

  @override
  State<CityView> createState() => _CityState();
}

class _CityState extends State<CityView> with WidgetsBindingObserver {
  late Trip trip;
  late int index;

  @override // 1. Initialisation
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    index = 0;
    trip = Trip(city: null, activities: [], date: DateTime.now());
    // print('initState appelé');
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

  void toggleActivity(Activity activity) {
    setState(() {
      trip.activities.contains(activity)
          ? trip.activities.remove(activity)
          : trip.activities.add(activity);
    });
  }

  void deleteTripActivity(Activity activity) {
    setState(() {
      trip.activities.remove(activity);
    });
  }

  void saveTrip(String cityName) async {
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

    if(trip.date == null){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Attention !'),
          content: Text('Vous n\'avez pas entré la date'),
          actions: <Widget>[
            FloatingActionButton(onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Ok'),
            ),
          ],
        );
      });
    }else if(result == 'save'){
      // widget.addTrip(trip);
      trip.city = cityName;
      Provider.of<TripProvider>(context).addTrip(trip);
       Navigator.pushNamed(context, Home.routeName);
    }

  }
 
  double get amount {
    return trip.activities.fold(0.0, (prev, element) {
      return prev + element.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final City city = ModalRoute.of(context)!.settings.arguments as City;
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String cityName = args['cityName'] as String;
    
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);
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
        child: Column(
          children: <Widget>[
            TripOverview(
              setDate: setDate,
              myTrip: trip,
              cityName: city.name,
              amount: amount,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: city.activities,
                      selectedActivities: trip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: trip.activities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          saveTrip(city.name);
        },
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

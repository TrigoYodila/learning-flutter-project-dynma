import 'package:first_project/views/trips/trips_view.dart';

import '../views/home/home.dart';
import 'package:flutter/material.dart';

class DymaDrawer extends StatelessWidget {
  const DymaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withValues(alpha: 0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )),
                child: Text(
                  'Dymatrip', 
                  style: TextStyle(color: Colors.white, fontSize: 30)
                ),
          ),
          ListTile(leading: Icon(Icons.home),title: Text('Accueil'),
            onTap: (){
              Navigator.pushNamed(context, Home.routeName);
            },
          ),
          Divider(color: Colors.grey[600],),
          ListTile(leading: Icon(Icons.flight),title: Text('Mes voyages'),
            onTap: (){
              Navigator.pushNamed(context, TripsView.routeName);
            },
          ),
          ],
          ),
        );
  }
}
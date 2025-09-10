import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {

  final Function setDate;
  final Trip myTrip;

  const TripOverview({super.key, required this.setDate, required this.myTrip});

  double get amount{
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Paris', style: TextStyle(fontSize: 25,decoration: TextDecoration.underline)),
                  Row(
                    children: <Widget>[
                      Expanded(child: Text(myTrip.date != null ? DateFormat('d/M/y').format(myTrip.date) : 'choisissez une date'  , style: TextStyle(fontSize: 20))),
                      ElevatedButton(onPressed: ()=>setDate(), child: Text('Sélectionnez une date'))
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Expanded(child: Text('Montant / personne', style: TextStyle(fontSize: 20))),
                      Text('$amount \$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            );
  }
}
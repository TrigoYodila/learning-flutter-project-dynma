import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/trip_model.dart';

// class TripOverview extends StatelessWidget {

//   final Function setDate;
//   final Trip myTrip;
//   final String cityName;
//   final double amount;

//   const TripOverview({super.key, required this.setDate, required this.myTrip, required this.cityName, required this.amount});


//   @override
//   Widget build(BuildContext context) {

//     var orientation = MediaQuery.of(context).orientation;
//     var size = MediaQuery.of(context).size;


//     return Container(
//               padding: EdgeInsets.all(10),
//               height: 200,
//               width: orientation == Orientation.landscape ? size.width * 0.5 : size.width,
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(cityName, style: TextStyle(fontSize: 25,decoration: TextDecoration.underline)),
//                   Row(
//                     children: <Widget>[
//                       Expanded(child: Text(myTrip.date != null ? DateFormat('d/M/y').format(myTrip.date) : 'choisissez une date'  , style: TextStyle(fontSize: 20))),
//                       ElevatedButton(onPressed: ()=>setDate(), child: Text('Sélectionnez une date'))
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   Row(
//                     children: <Widget>[
//                       Expanded(child: Text('Montant / personne', style: TextStyle(fontSize: 20))),
//                       Text('$amount \$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
//                     ],
//                   )
//                 ],
//               ),
//             );
//   }
// }

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip mytrip;
  final String cityName;
  final double amount;

  const TripOverview({super.key, required this.setDate, required this.mytrip, required this.cityName, required this.amount});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width:
      orientation == Orientation.landscape ? size.width * 0.5 : size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  mytrip.date != null
                      ? DateFormat('d/M/y').format(mytrip.date!)
                      : 'Sélectionnez une date',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: const Text('Sélectionnez une date'),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              const Expanded(
                child: Text(
                  'Montant / personne',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                '$amount€',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
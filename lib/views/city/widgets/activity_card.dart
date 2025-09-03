import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return 
    Container( 
      color: Colors.red.shade100, 
      width: double.infinity,   // 
      margin: EdgeInsets.all(1),
      child: Image(image: AssetImage(activity.image), fit: BoxFit.cover),   //Image.asset(activity.image, fit: BoxFit.cover)
    );
    // Card(
    //   child: ListTile(
    //     // leading: Image.asset(activity.image, width: 50),
    //     leading: CircleAvatar(
    //       backgroundImage: AssetImage(activity.image),
    //     ),
    //     title: Text(activity.name),
    //     subtitle: Text(activity.name),
    //     trailing: Checkbox(value: false, tristate: false, onChanged: (value) {}),
    //   ),
    // );
  }
}
import 'package:flutter/material.dart';
import '../../../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.isSelected,
    required this.toggleActivity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red.shade100,
      // width: double.infinity,   //
      margin: EdgeInsets.all(1),
      height: 150,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Ink.image(
            image: NetworkImage(activity.image),
            fit: BoxFit.cover,
            child: InkWell(onTap: toggleActivity),
          ),
          Container(
            // color: Colors.red.shade100,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      if (isSelected)
                        Icon(Icons.check, size: 40, color: Colors.white),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: FittedBox(child: Text(
                        activity.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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

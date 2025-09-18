import '../../../models/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({
    super.key,
    required this.activities,
    required this.deleteTripActivity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var activity = activities[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(activity.image),
              ),
              title: Text(activity.name, 
                // style: Theme.of(context).textTheme.bodySmall
              ),
              subtitle: Text(activity.city),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  deleteTripActivity(activity.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Activité supprimé !'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Annuler', 
                        onPressed: (){
                          print('testing');
                        }
                      ),
                    )
                  );
                },
              ),
            ),
          );
        },
        itemCount: activities.length,
      ),
    );
  }
}

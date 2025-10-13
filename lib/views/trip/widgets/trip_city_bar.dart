import 'package:first_project/models/city_model.dart';
import 'package:flutter/material.dart';

class TripCityBar extends StatelessWidget {
  final City city;

  const TripCityBar({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Image.network(city.image, fit: BoxFit.cover,),
          Container(
            color: Colors.black38,
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,))
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(city.name, style: TextStyle(fontSize: 30, color: Colors.white),),
                  ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
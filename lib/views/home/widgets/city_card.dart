import 'package:first_project/models/city_model.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
        child: SizedBox(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                // image: AssetImage(city.image),   // 'assets/images/ville3.jpg'
                image: NetworkImage(city.image),   // 'assets/images/ville3.jpg'
                fit: BoxFit.cover,
                child: InkWell(
                  onTap:(){
                    // Navigator.push(context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CityView()
                    //   )
                    // );
                    Navigator.pushNamed(
                      context, 
                      '/city',
                      arguments: {
                        'cityName': city.name,
                      },
                    );
                  },
                ),
              ),
              // Image.asset('assets/images/ville2.jpg', fit: BoxFit.cover),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.black54,
                  child: Text(city.name, style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),),
                ))
            ],
          ),
        ),
      );
  }
}

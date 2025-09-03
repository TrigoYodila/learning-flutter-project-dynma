
import 'widgets/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home>{

  List cities = [
    { 'name':'Paris', 'image':'assets/images/ville1.jpg', 'checked':false},
    { 'name':'Lyon', 'image':'assets/images/ville2.jpg', 'checked':false},
    { 'name':'Nice', 'image':'assets/images/ville3.jpg', 'checked':false},
  ];

  void switchChecked(city){
    int index = cities.indexOf(city);
    setState(() {  // signifie au widget de faire un rebuild
       cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('dymatrip'),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // CityCard(image: 'assets/images/ville3.jpg', name: 'Paris'),
              ...cities.map((city){  // transforme l'array de Widget en list
                return CityCard(name: city['name'], image: city['image'], checked: city['checked'],
                  updateChecked: () => switchChecked(city)
                );
              })
              // CityCard(),
              // CityCard()
            ],
          ),
        ),
      );
  }
}
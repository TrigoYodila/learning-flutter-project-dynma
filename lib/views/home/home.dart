
import 'package:first_project/models/city_model.dart';
import 'package:first_project/widgetts/ask_modal.dart';
import 'widgets/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home>{

  List cities = [
    City(name: 'Paris', image: 'assets/images/ville1.jpg'),
    City(name: 'Lyon', image: 'assets/images/ville2.jpg'),
    City(name: 'Nice', image: 'assets/images/ville3.jpg'),
  ];

  Future<void> openModal(BuildContext context) async {
    final result = await askModal(context, 'Hello veux tu quelque chose !');
    print('Result $result');
  }

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
                return CityCard(
                  city:city
                );
              }),
              ElevatedButton(onPressed: () => openModal(context), child: Text('modal'))
              // CityCard(),
              // CityCard()
            ],
          ),
        ),
      );
  }
}
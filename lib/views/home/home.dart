
import 'package:first_project/models/city_model.dart';
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/widgetts/ask_modal.dart';
import 'package:provider/provider.dart';
import '../../widgetts/dyma_drawer.dart';
import 'widgets/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // final List<City> cities;

  const Home({super.key});
  static const String routeName = '/';

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home>{


  Future<void> openModal(BuildContext context) async {
    final result = await askModal(context, 'Hello veux tu quelque chose !');
    print('Result $result');
  }

  // void switchChecked(city){
  //   int index = widget.cities.indexOf(city);
  //   setState(() {  // signifie au widget de faire un rebuild
  //      widget.cities[index]['checked'] = !cities[index]['checked'];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    return Scaffold(
        appBar: AppBar(
          title: Text('dymatrip'),
        ),
        drawer: DymaDrawer(),
        body: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
              // CityCard(image: 'assets/images/ville3.jpg', name: 'Paris'),
              cities.map((city){  // transforme l'array de Widget en list
                return CityCard(
                  city:city
                );
              }).toList()),
              // CityCard(),
              // CityCard()
          ),
        );
  }
}
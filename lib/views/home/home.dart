
import 'package:first_project/models/city_model.dart';
import 'package:first_project/providers/city_provider.dart';
import 'package:first_project/widgetts/ask_modal.dart';
import 'package:first_project/widgetts/dyma_loader.dart';
import 'package:provider/provider.dart';
import '../../widgetts/dyma_drawer.dart';
import 'widgets/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

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
          // alignment: Alignment.topLeft,
          child: RefreshIndicator(  // permet d'effectuer une action au moment du refresh
            onRefresh: Provider.of<CityProvider>(context).fetchData, // on fetch de nouveau les datas
            child: cities.isNotEmpty ? ListView.builder(
            itemCount: cities.length,
            itemBuilder: (_,i) => CityCard(
                  city:cities[i]
                ),
            ) : DymaLoader(),
          ),
              // CityCard(),
              // CityCard()
          ),
        );
  }
}
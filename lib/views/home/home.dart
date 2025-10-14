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

  TextEditingController searchController = TextEditingController();

  Future<void> openModal(BuildContext context) async {
    final result = await askModal(context, 'Hello veux tu quelque chose !');
    print('Result $result');
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CityProvider cityProvider = Provider.of<CityProvider>(context);
    List<City> filteredCities = Provider.of<CityProvider>(context).filteredCities(searchController.text);
    return Scaffold(
        appBar: AppBar(
          title: Text('dymatrip'),
        ),
        drawer: DymaDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 14), 
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Rechercher une ville',
                        prefixIcon: Icon(Icons.search)
                      ),
                      // onChanged: (value) {
                      //   setState(() {});
                      // },
                      onSubmitted: (value){
                        setState(() {});
                      },
                    ),
                  ),
                  IconButton(onPressed: (){
                    setState(() => searchController.clear());
                  }, icon: Icon(Icons.clear))
                ],
              )
              ),
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(10.0),
              // alignment: Alignment.topLeft,
              child: RefreshIndicator(  // permet d'effectuer une action au moment du refresh
                onRefresh: Provider.of<CityProvider>(context).fetchData, // on fetch de nouveau les datas
                child: cityProvider.isLoading ? DymaLoader() : filteredCities.isNotEmpty ? ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (_,i) => CityCard(
                      city:filteredCities[i]
                    ),
                ) : Text('Aucun resultat'),
              ),
                  // CityCard(),
                  // CityCard()
              ),
            ),
          ]
        ),
        );
  }
}
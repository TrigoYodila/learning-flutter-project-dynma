import 'dart:collection';
import 'package:first_project/models/city_model.dart';
import 'package:flutter/foundation.dart';
import '../data/data.dart' as data;

class CityProvider with ChangeNotifier {

  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);  // rend immutable la liste des éléments
  
  City getCityByName(String cityName) => cities.firstWhere((city) => city.name == cityName);
  
  // @override
  // void notifyListeners() {

  //   super.notifyListeners();
  // }
}
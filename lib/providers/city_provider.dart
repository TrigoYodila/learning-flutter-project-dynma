import 'dart:collection';
import 'package:first_project/models/city_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityProvider with ChangeNotifier {

  final String host = 'http://10.0.2.2:5000';
  List<City> _cities = [];
  bool isLoading = false;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);  // rend immutable la liste des éléments
  
  City getCityByName(String cityName) => cities.firstWhere((city) => city.name == cityName);
  
  UnmodifiableListView<City> filteredCities(String filter) => UnmodifiableListView(_cities.where((city)=>city.name.toLowerCase().startsWith(filter.toLowerCase())).toList());

  Future<void> fetchData() async {
    try {
      isLoading = true;
      final url = Uri.parse('$host/api/cities');
      http.Response response = await http.get(url);
      // print(json.decode(response.body));
      if (response.statusCode == 200){
        _cities = (json.decode(response.body) as List).map((cityJson) => City.fromJson(cityJson)).toList();
         isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
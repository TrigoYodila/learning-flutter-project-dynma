import 'dart:collection';
import 'dart:io';
import 'package:first_project/models/activity_model.dart';
import 'package:first_project/models/city_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';


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

  Future<void> addActivityToCity(Activity newActivity) async {
  
    try {
      String cityId = getCityByName(newActivity.city).id;
      final url = Uri.parse('$host/api/city/$cityId/activity');
      http.Response response = await http.post(url, headers: {
        'Content-type':'application/json'
      },body: json.encode(newActivity.toJson()));
      if(response.statusCode == 200){
        int index = _cities.indexWhere((city) => city.id == cityId);
        _cities[index] = City.fromJson(json.decode(response.body));
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> verifyIfActivityNameIsUnique(String cityName, String activityName) async {
    try {
      City city = getCityByName(cityName);
      final url = Uri.parse('$host/api/city/${city.id}/activities/verify/$activityName');
      http.Response response = await http.get(url);
      if (response.body != null){
         return json.decode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadImage(File pickedImage) async{
    
    try {
      final url = Uri.parse('$host/api/activity/image');
      var request = http.MultipartRequest("POST", url);

      request.files.add(
        http.MultipartFile.fromBytes(
          'activity', 
          pickedImage.readAsBytesSync(), 
          filename: basename(pickedImage.path), 
          contentType: MediaType("multipart", "form-data"))
      );

      var response = await request.send();
      if (response.statusCode == 200){
        var responseData = await response.stream.toBytes();
        return json.decode(String.fromCharCodes(responseData));
      }else{
        throw 'error';
      }

    } catch (e) {
      rethrow;
    }
  }

}
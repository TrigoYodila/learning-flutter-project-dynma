import 'package:first_project/models/city_model.dart';
import 'package:first_project/models/trip_model.dart';

import '../models/activity_model.dart';

List<City> cities = [
  City(
  name: 'Paris', 
  image: 'assets/images/ville1.jpg', 
  activities: [
  Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Le Louvre',
    id: 'a1',
    city: 'Paris',
    price: 12.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'Les buttes Chaumont',
    id: 'a2',
    city: 'Paris',
    price: 5.00,
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'Notre Dame',
    id: 'a3',
    city: 'Paris',
    price: 15.00,
  ),
  Activity(
    image: 'assets/images/activities/act4.jpg',
    name: 'La Défense',
    id: 'a4',
    city: 'Paris',
    price: 11.00,
  ),
  Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Mon âme te loue',
    id: 'a5',
    city: 'Paris',
    price: 18.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'La Défense',
    id: 'a6',
    city: 'Paris',
    price: 20.00,
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'La Défense',
    id: 'a7',
    city: 'Paris',
    price: 16.00,
  ),
]),
  City(name: 'Lyon', image: 'assets/images/ville2.jpg',activities: [
  Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Le Louvre',
    id: 'a1',
    city: 'Paris',
    price: 12.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'Les buttes Chaumont',
    id: 'a2',
    city: 'Paris',
    price: 5.00,
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'Notre Dame',
    id: 'a3',
    city: 'Paris',
    price: 15.00,
  ),
  Activity(
    image: 'assets/images/activities/act4.jpg',
    name: 'La Défense',
    id: 'a4',
    city: 'Paris',
    price: 11.00,
  ),
  Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Mon âme te loue',
    id: 'a5',
    city: 'Paris',
    price: 18.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'La Défense',
    id: 'a6',
    city: 'Paris',
    price: 20.00,
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'La Défense',
    id: 'a7',
    city: 'Paris',
    price: 16.00,
  ),
]),
  City(name: 'Nice', image: 'assets/images/ville3.jpg',activities: [
  Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Le Louvre',
    id: 'a1',
    city: 'Paris',
    price: 12.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'Les buttes Chaumont',
    id: 'a2',
    city: 'Paris',
    price: 5.00,
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'Notre Dame',
    id: 'a3',
    city: 'Paris',
    price: 15.00,
  ),
  Activity(
    image: 'assets/images/activities/act4.jpg',
    name: 'La Défense',
    id: 'a4',
    city: 'Paris',
    price: 11.00,
  ),
  Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Mon âme te loue',
    id: 'a5',
    city: 'Paris',
    price: 18.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'La Défense',
    id: 'a6',
    city: 'Paris',
    price: 20.00,
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'La Défense',
    id: 'a7',
    city: 'Paris',
    price: 16.00,
  ),
]),
];


 List<Trip> trips = [
    Trip(city: 'Paris', activities: [
      Activity(
    image: 'assets/images/activities/act1.jpg',
    name: 'Le Louvre',
    id: 'a1',
    city: 'Paris',
    price: 12.00,
  ),
  Activity(
    image: 'assets/images/activities/act2.jpg',
    name: 'Les buttes Chaumont',
    id: 'a2',
    city: 'Paris',
    price: 5.00,
    status:ActivityStatus.done
  ),
  Activity(
    image: 'assets/images/activities/act3.jpg',
    name: 'Notre Dame',
    id: 'a3',
    city: 'Paris',
    price: 15.00,
  ),
    ], date: DateTime.now().add(Duration(days: 1))),
    Trip(city: 'Lyon', activities: [], date: DateTime.now().add(Duration(days: 2))),
    Trip(city: 'Nice', activities: [], date: DateTime.now().subtract(Duration(days: 1)))
  ];

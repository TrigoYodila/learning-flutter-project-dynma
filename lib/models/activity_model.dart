

enum ActivityStatus { ongoing, done}

class Activity {
  String id;
  String name;
  String image;
  String city;
  double price;
  ActivityStatus status;

  Activity({required this.name, required this.image, required this.city, required this.id, required this.price, this.status = ActivityStatus.ongoing});

  // permet de transformer le json en objet dart.
  Activity.fromJson(Map<String, dynamic> json) 
  : id = json['_id'],
  name = json['name'],
  image = json['image'],
  city = json['city'],
  price = json['price'].toDouble(),
  status = json['staus'] == 0 ? ActivityStatus.ongoing : ActivityStatus.done;
}
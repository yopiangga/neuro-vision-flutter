import 'package:cloud_firestore/cloud_firestore.dart';

class Hospital {
  String name;
  String address;
  String price;
  List<dynamic> image;
  String description;
  String rating;
  List<dynamic> doctors;
  GeoPoint geolocation;
  String service_hours;
  String telephone;
  String id;

  Hospital({
    required this.name,
    required this.address,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.doctors,
    required this.geolocation,
    required this.service_hours,
    required this.telephone,
    required this.id,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      name: json['name'],
      address: json['address'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
      rating: json['rating'],
      doctors: json['doctors'],
      geolocation: json['geolocation'],
      service_hours: json['service_hours'],
      telephone: json['telephone'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "price": price,
        "image": image,
        "description": description,
        "rating": rating,
        "doctors": doctors,
        "geolocation": geolocation,
        "service_hours": service_hours,
        "telephone": telephone,
        "id": id,
      };
}

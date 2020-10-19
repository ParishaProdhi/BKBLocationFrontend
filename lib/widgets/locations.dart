// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

List<Location> locationFromJson(String str) => List<Location>.from(
    json.decode(str).map((x) => Location.fromJson(x))); //eikhane problem

String locationToJson(List<Location> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Location {
  Location({
    this.id,
    this.typeId,
    this.name,
    this.address,
    this.lattitude,
    this.longitude,
  });

  int id;
  int typeId;
  String name;
  String address;
  double lattitude;
  double longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        typeId: json["type_id"],
        name: json["name"],
        address: json["address"],
        lattitude: json["lattitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_id": typeId,
        "name": name,
        "address": address,
        "lattitude": lattitude,
        "longitude": longitude,
      };
}

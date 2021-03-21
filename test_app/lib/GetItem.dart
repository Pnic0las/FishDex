import 'package:hive/hive.dart';

part 'GetItem.g.dart';

@HiveType(typeId: 0)
class Fish extends HiveObject{

  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  bool isFav;
  @HiveField(3)
  String lat;
  @HiveField(4)
  String long;

  Fish(this.name, this.url, this.isFav, this.lat ,this.long);

  factory Fish.fromJson(dynamic json) {
    return Fish(json["name"] as String, json["url"] as String, false, json["lat"] as String, json["long"] as String);
  }

  @override
  String toString() {
    return 'Fish = ${this.name}\nIs Fav = $isFav\nUrl = $url\n Lat et Long =  $lat et $long';
  }
}

class Fish{

  String name;
  String url;

  Fish(this.name, this.url);

  factory Fish.fromJson(dynamic json) {
    return Fish(json["name"] as String, json["url"] as String);
  }

  @override
  String toString() {
    return 'Fish = ${this.name}\n';
  }
}
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:test_app/main.dart';
import 'package:test_app/widgets/Fish_info.dart';
import 'package:test_app/widgets/custom_drawer.dart';
import 'package:test_app/GetItem.dart';
import 'dart:io';
import 'dart:convert';

class Aquarium extends StatefulWidget {
  const Aquarium({Key key,}) : super(key: key);

  @override
  _AquariumState createState() => _AquariumState();
}


class _AquariumState extends State<Aquarium> {
    
    List<Fish> fish = new List();
    Future<String> getJson() {
  return rootBundle.loadString('lib/Fishlist.json');
}

Future<List<Fish>> getItems() async {
  var data = jsonDecode(await getJson()) as List;
  return data.map((itemJson) => Fish.fromJson(itemJson)).toList();
}

void ReadJson() async{
  getItems().then((value) => 
  setState(() {
    fish =  value;
  })
  );
}

    
    @override
    void initState()  { 
      super.initState();
       ReadJson();
    }

  @override
  Widget build(BuildContext context) {
    final title = 'Fish Dex';

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: CustomDrawer(),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: fish.map((Fish destination) {
            return FishInfo(fishname: destination.name, urlfish: destination.url,
             
              );
            }).toList()),  
        );
  }
}

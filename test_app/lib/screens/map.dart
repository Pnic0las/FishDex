import 'package:flutter/material.dart';
import 'package:test_app/widgets/custom_drawer.dart';

class map extends StatelessWidget {
  const map({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Map"),
          iconTheme: IconThemeData(color: Colors.white)),
      drawer: CustomDrawer(),
      body: Container(
        child: Center(
            child: Text("Map page",
                style: TextStyle(fontSize: 20))),
      ),
    );
  }
}

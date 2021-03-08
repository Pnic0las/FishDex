import 'package:flutter/material.dart';
import 'package:test_app/widgets/custom_drawer.dart';

class FishClicked extends StatelessWidget {
  const FishClicked({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FishClicked"),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Center(
            child: Text("FishClicked page",
                style: TextStyle(fontSize: 20))),
      ),
    );
  }
}
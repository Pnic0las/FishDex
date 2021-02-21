import 'package:flutter/material.dart';
import 'package:test_app/widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Center(
            child: Text("Home page",
                style: TextStyle(fontSize: 20))),
      ),
    );
  }
}

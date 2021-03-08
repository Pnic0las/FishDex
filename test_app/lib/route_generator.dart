import 'package:flutter/material.dart';
import 'package:test_app/screens/Fish_clicked.dart';
import 'package:test_app/screens/aquarium.dart';
import 'package:test_app/screens/map.dart';
import 'package:test_app/screens/home.dart';
import 'package:test_app/screens/profile.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Home());
      case "/profile":
        return MaterialPageRoute(builder: (context) => Profile());
      case "/aquarium":
        return MaterialPageRoute(builder: (context) => Aquarium());
      case "/map":
        return MaterialPageRoute(builder: (context) => map());
      case "/fishclicked":
        return MaterialPageRoute(builder: (context) => FishClicked());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page not found'),
        ),
        body: Center(
          child: Text("this page doesn't exist :'(",
              style: TextStyle(fontSize: 20)),
        ),
      );
    });
  }
}

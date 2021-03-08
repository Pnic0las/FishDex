import 'package:flutter/material.dart';
import 'package:test_app/GetItem.dart';
import 'package:test_app/route_generator.dart';
import 'package:test_app/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>("user_avatar");
  runApp(FishDex());
}

Future<String> getJson() {
  return rootBundle.loadString('lib/Fishlist.json');
}

Future<List<Fish>> getItems() async {
  var data = jsonDecode(await getJson()) as List;
  return data.map((itemJson) => Fish.fromJson(itemJson)).toList();
}

class FishDex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme theme = new AppTheme();
    return MaterialApp(
      title: 'FishDex',
      theme: ThemeData(
        primarySwatch: theme.primarySwatch,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

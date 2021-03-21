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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image(image: AssetImage("images/Logo.png")),
                ),
                Text("FLUTTER DEX",
                    style:
                        TextStyle(fontSize: 55, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 85,
                ),
                Text(
                  "Get information on the underwater fauna of Reunion Island\n\nOur motivation is to present to tourists and swimmers the underwater fauna of Reunion Island in order to encourage them to preserve it.",
                  style: TextStyle(fontSize: 25, color: Color(0xFF5ACCBF)),
                )
              ]),
        ));
  }
}

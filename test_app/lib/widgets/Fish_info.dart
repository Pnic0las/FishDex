import 'package:flutter/material.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/widgets/PopUp_Fish.dart';



class FishInfo extends StatelessWidget {
  const FishInfo({Key key, this.fishname, this.urlfish}) : super(key: key);
  final String fishname;
  final String urlfish;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
    child: Card(
      
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            //Navigator.of(context).pushReplacementNamed("/fishclicked");
            showDialog(
              context: context,
              builder: (BuildContext context) => PopupFish(url:urlfish),
            );
          },
          child: Stack(
                      children: [ Column(
                        mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(urlfish),
              Center(
                child: Text(fishname,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              )
            ],

          ),  
                      ],
        ),
      ),
    ),
    );
  }
}
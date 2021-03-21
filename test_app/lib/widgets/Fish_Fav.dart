import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/GetItem.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/widgets/PopUp_Fish.dart';

class FishFav extends StatefulWidget {
  const FishFav(
      {Key key,
      this.fishname,
      this.urlfish,
      this.lat,
      this.long,
      this.ontapLocate})
      : super(key: key);
  final String fishname;
  final String urlfish;
  final String lat;
  final String long;
  final void Function(double lat, double long) ontapLocate;
  @override
  _FishFavState createState() => _FishFavState();
}

class _FishFavState extends State<FishFav> {
  Box<Fish> _fish;

  @override
  void initState() {
    super.initState();
    _fish = Hive.box("fish_infos");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            if (widget.ontapLocate != null) {
            widget.ontapLocate(double.parse(widget.lat), double.parse(widget.long));  
            }
          },
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(widget.urlfish),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            widget.fishname,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
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

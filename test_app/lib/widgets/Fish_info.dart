import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/GetItem.dart';
import 'package:test_app/theme.dart';
import 'package:test_app/widgets/PopUp_Fish.dart';

class FishInfo extends StatefulWidget {
  const FishInfo({Key key, this.fishname, this.urlfish, this.lat, this.long})
      : super(key: key);
  final String fishname;
  final String urlfish;
  final String lat;
  final String long;

  @override
  _FishInfoState createState() => _FishInfoState();
}

class _FishInfoState extends State<FishInfo> {
  Box<Fish> _fish;
  bool boolean = false;

  void areYouHere(String name) {
    for (var i = 0; _fish.get(i) != null; i++) {
      if (name == _fish.get(i).name) {
        setState(() {
          boolean = _fish.get(i).isFav;
        });
      }
    }
  }

  int indexFinder(String name) {
    for (var ind = 0; _fish.get(ind) != null; ind++) {
      if (name == _fish.get(ind).name) {
        return (ind);
      }
    }
    return (-1);
  }

  @override
  void initState() {
    super.initState();
    _fish = Hive.box("fish_infos");
    
    areYouHere(widget.fishname);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            //Navigator.of(context).pushReplacementNamed("/fishclicked");
            showDialog(
              context: context,
              builder: (BuildContext context) => PopupFish(url: widget.urlfish),
            );
          },
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(widget.urlfish),
                  Row(
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
                      IconButton(
                        icon: Icon(
                            boolean ? Icons.favorite : Icons.favorite_border),
                        onPressed: () {
                          if (boolean == true) {
                            int i = indexFinder(widget.fishname);
                            if (i != -1) {
                              _fish.putAt(
                                  i,
                                  Fish(widget.fishname, widget.urlfish, false,
                                      widget.lat, widget.long));
                            }
                            setState(() {
                              boolean = false;
                            });
                          } else {
                            int index = indexFinder(widget.fishname);
                            if (index != -1) {
                              _fish.putAt(
                                  index,
                                  Fish(widget.fishname, widget.urlfish, true,
                                      widget.lat, widget.long));
                            } else
                              _fish.add(Fish(widget.fishname, widget.urlfish,
                                  true, widget.lat, widget.long));
                            setState(() {
                              boolean = true;
                            });
                          }
                        },
                      )
                    ],
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

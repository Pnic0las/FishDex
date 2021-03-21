import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/GetItem.dart';
import 'package:test_app/widgets/Fish_Fav.dart';
import 'package:test_app/widgets/custom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  final picker = ImagePicker();
  Box<String> _avatar;
  Box<Fish> _fish;
  String _64avatar;
  List <Fish> favList = [];

  void getFav() {
    for (var i = 0; _fish.get(i) != null; i++) {
      if (_fish.get(i).isFav == true) {
        
      setState(() {
      favList.add(_fish.get(i));  
      });
      }
    }
  }
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      List<int> imageBytes = await _image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      _avatar.put("avatar", base64Image);
      setState(() {
        _64avatar = base64Image;
      });
    } else {
      print('No image selected.');
    }
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fish = Hive.box("fish_infos");
    _avatar = Hive.box("user_avatar");
    getFav();
    print(favList);
    if (_avatar.containsKey("avatar")) {
      _64avatar = _avatar.get("avatar");
      print(_64avatar);
    } else {
      print("NO AVATAR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Center(
            child: _64avatar == null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://medgoldresources.com/wp-content/uploads/2018/02/avatar-placeholder.gif%22"),
                    radius: 70,
                  )
                : ClipOval(
                    child: (imageFromBase64String(_64avatar)),
                  ),
          ),
          SizedBox(height: 20,),
          Text("Favorite Fishes",
          style: TextStyle(fontSize: 35,
          fontWeight: FontWeight.bold,),
          ),
          if (favList.isNotEmpty) 
          SizedBox(height: 20,),
            
          Expanded(
                      child: GridFish(favList: favList),
          )
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class GridFish extends StatelessWidget {
  const GridFish({
    Key key,
    @required this.favList, this.controller, this.ontapLocate,
  }) : super(key: key);

  final ScrollController controller;
  final List<Fish> favList;
  final void Function(double lat, double long) ontapLocate;

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
    controller: controller,
            children: favList.map((Fish destination) {
              return FishFav(fishname: destination.name, urlfish: destination.url,lat: destination.lat,long: destination.long,ontapLocate: ontapLocate,);
            }).toList(),
            
            );
  }
}

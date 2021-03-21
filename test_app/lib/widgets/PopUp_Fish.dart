import 'package:flutter/material.dart';
import 'package:test_app/theme.dart';

class PopupFish extends StatelessWidget {
const PopupFish({Key key, this.url}) : super(key: key);
final String url;

  @override
Widget build(BuildContext context) {
  return new AlertDialog(
    title: const Text('More information'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Image.network(url),

        Text("Description",
        style: TextStyle (fontWeight: FontWeight.bold),),
        Text("Goldfish are lively and to slow species. However, they will be calm and peaceful with any roommate over half their size. Beware of certain plants, and prefer aquatic plants with solid leaves like Anubias with a classic plant Anubias nana for example.")
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
}
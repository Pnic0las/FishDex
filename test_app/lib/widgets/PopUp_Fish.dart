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
        Text("Proinde concepta rabie saeviore, quam desperatio incendebat et fames, amplificatis viribus ardore incohibili in excidium urbium matris Seleuciae efferebantur, quam comes tuebatur Castricius tresque legiones bellicis sudoribus induratae.")
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
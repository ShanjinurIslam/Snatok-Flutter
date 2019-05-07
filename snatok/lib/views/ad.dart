import 'package:flutter/material.dart';
import 'dart:async'; //for returning future values
import 'package:snatok/widgets/ui_elements/ad_title.dart';

class SingleAd extends StatelessWidget {
  final Map<String, dynamic> map;

  SingleAd(this.map);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ad Details'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(map['image']),
            Center(
                child: Container(
                    child: Column(
              children: <Widget>[
                AdTitle(map['title']),
                Text(map['description']),
                Text(map['location']),
                Text(map['price'].toString()),
              ],
            ))),
          ],
        ),
      ),
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
    );
  }
}

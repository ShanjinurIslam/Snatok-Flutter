import 'package:flutter/material.dart';
import 'dart:async';

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
            Center(child: Container(child: Column(
              children: <Widget>[
                Text(map['title']),
                Text(map['description']),
                Text(map['location']),
                Text(map['price'].toString()),
              ],
            ))),
            /*Center(
              child: FlatButton(
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  showDialog(
                      builder: (BuildContext context) {
                        return AlertDialog(
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Delete'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context, true);
                              },
                            ),
                            FlatButton(
                              child: Text('Continue'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                          title: Text('Delete Ad'),
                          content: Text('Are you sure?'),
                        );
                      },
                      context: context);
                },
              ),
            )*/
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

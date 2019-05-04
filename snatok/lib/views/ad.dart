import 'package:flutter/material.dart';
import 'dart:async';

class SingleAd extends StatelessWidget {
  final String imageURL, value;

  SingleAd(this.imageURL, this.value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ad Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageURL),
            Center(
                child: Container(
              child: Text(value),
              margin: EdgeInsets.all(20),
            )),
            Center(
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
            )
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

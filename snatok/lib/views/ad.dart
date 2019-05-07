import 'package:flutter/material.dart';
import 'package:snatok/widgets/ads/ad_address.dart';
import 'package:snatok/widgets/ads/price_tag.dart';
import 'dart:async'; //for returning future values
import 'package:snatok/widgets/ui_elements/ad_title.dart';

class SingleAd extends StatelessWidget {
  final Map<String, dynamic> map;

  SingleAd(this.map);

  Widget _buildTitlePrice(String title, String value) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AdTitle(title),
            SizedBox(
              width: 10,
            ),
            PriceTag(value)
          ],
        ));
  }

  Widget _buildAddress() {
    return AdAddress(map['location']);
  }

  Widget _buildDescription() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            child: Text(map['description']),
          ),
        )
      ],
    );
  }

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
                _buildTitlePrice(map['title'], map['price'].toString()),
                _buildDescription(),
                _buildAddress(),
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

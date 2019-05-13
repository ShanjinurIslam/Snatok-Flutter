import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/widgets/ads/ad_address.dart';
import 'package:snatok/widgets/ads/price_tag.dart';
import 'dart:async'; //for returning future values
import 'package:snatok/widgets/ui_elements/ad_title.dart';

class SingleAd extends StatelessWidget {
  final int index;

  SingleAd(this.index);

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

  Widget _buildAddress(String location) {
    return AdAddress(location);
  }

  Widget _buildDescription(String description) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Card(
            child: Text(description),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /**/

    return ScopedModelDescendant<AdModel>(
      builder: (BuildContext context, Widget child, AdModel model) {
        return WillPopScope(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Ad Details'),
            ),
            body: Column(
              children: <Widget>[
                Image.asset(model.products[index].image),
                Center(
                    child: Container(
                        child: Column(
                  children: <Widget>[
                    _buildTitlePrice(model.products[index].title,
                        model.products[index].price.toString()),
                    _buildDescription(model.products[index].description),
                    _buildAddress(model.products[index].location),
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
      },
    );
  }
}

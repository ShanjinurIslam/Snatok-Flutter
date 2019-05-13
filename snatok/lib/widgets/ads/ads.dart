import 'package:flutter/material.dart';
import 'package:snatok/models/ad.dart';
import 'package:snatok/widgets/ads/ad_card.dart';


class Ads extends StatelessWidget {
  final List<Ad> products;
  Ads(this.products);

  Widget lists() {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index)=>AdCard(products[index], index),
      itemCount: products.length,
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget errormessage() {
      return Center(child: Text('No Contents Found'));
    }

    return products.length > 0 ? lists() : errormessage();
  }
}

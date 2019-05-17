import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/models/ad.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/widgets/ads/ad_card.dart';

class Ads extends StatelessWidget {
  Widget lists(List<Ad> products) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          AdCard(products[index], index),
      itemCount: products.length,
    );
  }

  Widget errormessage() {
    return Center(child: Text('No Contents Found'));
  }

  Widget _buildProductList(List<Ad> products) {
    return products.length > 0 ? lists(products) : errormessage();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AdModel>(
        builder: (BuildContext context, Widget child, AdModel model) {
      return _buildProductList(model.displayProducts);
    });
  }
}

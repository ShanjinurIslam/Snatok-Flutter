import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/models/ad.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/widgets/ads/price_tag.dart';
import 'package:snatok/widgets/ui_elements/ad_title.dart';
import 'package:snatok/widgets/ads/ad_address.dart';

class AdCard extends StatelessWidget {
  final Ad product;
  final int index;

  AdCard(this.product, this.index);

  void _details(BuildContext context) {
    Navigator.pushNamed(context, '/ad/' + index.toString());
  }

  Widget favIcon(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, AdModel model) {
        IconButton(
          onPressed: () {
            model.toggleAdFavorite(index);
          },
          icon: Icon(
            model.products[index].isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.pink,
            size: 30,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.asset(product.image,
              fit: BoxFit.cover, alignment: Alignment.center),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AdTitle(product.title),
                SizedBox(
                  width: 10,
                ),
                PriceTag(product.price.toString())
              ],
            ),
          ),
          AdAddress(product.location),
          Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => _details(context),
                  icon: Icon(
                    Icons.info,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                favIcon(context),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

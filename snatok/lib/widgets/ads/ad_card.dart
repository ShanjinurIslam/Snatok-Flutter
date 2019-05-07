import 'package:flutter/material.dart';
import 'package:snatok/widgets/ads/price_tag.dart';
import 'package:snatok/widgets/ui_elements/ad_title.dart';
import 'package:snatok/widgets/ads/ad_address.dart';

class AdCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  AdCard(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.asset(product['image'],
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
                AdTitle(product['title']),
                SizedBox(
                  width: 10,
                ),
                PriceTag(product['price'].toString())
              ],
            ),
          ),
          AdAddress(product['location']),
          Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ad/' + index.toString());
                  },
                  icon: Icon(
                    Icons.info,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/ad/' + index.toString());
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 30,
                  ),
                )
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

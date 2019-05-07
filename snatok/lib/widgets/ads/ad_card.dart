import 'package:flutter/material.dart';
import 'package:snatok/widgets/ads/price_tag.dart';

class AdCard extends StatelessWidget{
  final Map<String,dynamic> product ;
  final int index ;

  AdCard(this.product,this.index) ;

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
                Text(
                  product['title'],
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                SizedBox(
                  width: 10,
                ),
                PriceTag(product['price'].toString())
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent),
            child: Text(
              'Dhaka,Bangladesh',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
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
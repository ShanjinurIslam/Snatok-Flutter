import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Ads(this.products);

  Widget _listBuilderFunction(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.asset(products[index]['image'],
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
                  products[index]['title'],
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                  child: Text(
                    "\৳" + products[index]['price'].toString(),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).accentColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2.5),
            decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1.5),borderRadius: BorderRadius.circular(20)),
            child: Text('Dhaka,Bangladesh',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30,20,30,10),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(12)),
            child: FlatButton(
              child: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/ad/' + index.toString());
              },
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget lists() {
    return ListView.builder(
      itemBuilder: _listBuilderFunction,
      itemCount: products.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*return ListView(
              children: products
                  .map((elements) => Card(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/1.jpg'),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(elements),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                child: Text(
                                  'Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            );*/

    Widget errormessage() {
      return Center(child: Text('No Contents Found'));
    }

    return products.length > 0 ? lists() : errormessage();
  }
}

import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  final List<Map<String, String>> products;
  Ads(this.products);

  Widget _listBuilderFunction(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.asset(products[index]['image']),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              products[index]['title'],
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,fontFamily: 'Oswald'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: RaisedButton(
              child: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/ad/' + index.toString());
              },
            ),
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

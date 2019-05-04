import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function _deleteAd;
  Ads(this.products, this._deleteAd);

  Widget _listBuilderFunction(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(products[index]['title']),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: RaisedButton(
              child: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed<bool>(context, '/ad/'+index.toString()).then((value) {
                  if (value != null) {
                    if (value == true) {
                      _deleteAd(index);
                    }
                  }
                });
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

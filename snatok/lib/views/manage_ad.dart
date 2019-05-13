import 'package:flutter/material.dart';

class ManageAd extends StatefulWidget {
  final Function _deleteAd;
  final List<Map<String, dynamic>> products;

  ManageAd(this.products, this._deleteAd);

  @override
  State<StatefulWidget> createState() {
    return _ManageAdState();
  }
}

class _ManageAdState extends State<ManageAd> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(widget.products[index]['image']),
              ),
              title: Text(widget.products[index]['title']),
              subtitle: Text('\৳' + widget.products[index]['price'].toString()),
              trailing: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/edit_ad/' + index.toString());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Are you sure to remove?'),
                              content: Text('Once deleted can not be undone'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    widget._deleteAd(index);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Yes'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            );
                          },
                          context: context);
                    },
                  )
                ],
              ),
            ),
            Divider(),
          ],
        );
      },
      itemCount: widget.products.length,
    );
  }
}

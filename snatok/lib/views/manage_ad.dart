import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/ads.dart';

class ManageAd extends StatefulWidget {
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
    return ScopedModelDescendant<AdModel>(
      builder: (BuildContext context, Widget child, AdModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(model.products[index].image),
                  ),
                  title: Text(model.products[index].title),
                  subtitle:
                      Text('\৳' + model.products[index].price.toString()),
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
                                  content:
                                      Text('Once deleted can not be undone'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        model.deleteAd(index);
                                        Navigator.pop(context,false) ;
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
          itemCount: model.products.length,
        );
      },
    );
  }
}

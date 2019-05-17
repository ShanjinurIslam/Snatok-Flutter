import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/main.dart';

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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(model.AllProducts[index].image),
                  ),
                  title: Text(model.AllProducts[index].title),
                  subtitle:
                      Text('\৳' + model.AllProducts[index].price.toString()),
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
          itemCount: model.AllProducts.length,
        );
      },
    );
  }
}

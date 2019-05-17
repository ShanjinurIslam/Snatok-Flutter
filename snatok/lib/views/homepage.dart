import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/main.dart';
import 'package:snatok/widgets/ads/ads.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget toggleFav() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
          icon:
              Icon(model.displayMode ? Icons.favorite : Icons.favorite_border),
          onPressed: () {
            model.toggleDisplayMode();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Options'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text(
                'Manage Products',
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/manageads');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          toggleFav(),
        ],
      ),
      body: Center(child: Column(children: <Widget>[Expanded(child: Ads())])),
    );
  }
}

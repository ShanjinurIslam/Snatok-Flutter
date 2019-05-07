import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snatok/widgets/ads/ads.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  HomePage(this.products);

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
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.mic),
            onPressed: () {},
          )
        ],
      ),
      body: Center(child: Column(children: <Widget>[Expanded(child:Ads(widget.products))])),
    );
  }
}

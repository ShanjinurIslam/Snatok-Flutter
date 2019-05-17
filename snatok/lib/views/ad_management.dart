import 'package:flutter/material.dart';
import 'create_ad.dart';
import 'manage_ad.dart';

class AdManagement extends StatefulWidget {
  @override
  _AdManagementState createState() => _AdManagementState();
}

Drawer _buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          title: Text('Choose'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Home',
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        )
      ],
    ),
  );
}

class _AdManagementState extends State<AdManagement> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: _buildDrawer(context),
          appBar: AppBar(
            title: Text('Manage Ads'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Create Product',
                  icon: Icon(Icons.create),
                ),
                Tab(text: 'My Ads', icon: Icon(Icons.list))
              ],
            ),
          ),
          body: Center(
              child: TabBarView(
            children: <Widget>[
              CreateAd(),
              ManageAd(),
            ],
          )),
        ));
  }
}

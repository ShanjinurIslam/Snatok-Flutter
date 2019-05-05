import 'package:flutter/material.dart';
import 'create_ad.dart';
import 'manage_ad.dart';

class AdManagement extends StatelessWidget {
  Function _add; 
  Function _deleteAd;

  AdManagement(this._add,this._deleteAd) ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Choose'),
                ),
                ListTile(
                  title: Text(
                    'HomePage',
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Manage Ads'),
          ),
          body: Center(child: TabBarView(
            children: <Widget>[
              CreateAd(_add),ManageAd(_deleteAd)
            ],
          )),
          bottomNavigationBar: TabBar(tabs: <Widget>[
            Tab(text: 'Create Product',icon: Icon(Icons.create),),Tab(text:'My Ads',icon: Icon(Icons.list))
          ],),
        ));
  }
}

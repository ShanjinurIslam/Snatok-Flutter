import 'package:flutter/material.dart';
import 'ads_manager.dart';

class HomePage extends StatefulWidget {
  final List<Map<String,String>> products ; 
  final Function _add ;
  final Function _deleteAd ;

  HomePage(this.products,this._add,this._deleteAd) ;

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
              title: Text('Choose'),
            ),
            ListTile(
              title: Text(
                'Manage Products',
              ),
              onTap: () {
                 Navigator.pushReplacementNamed(context, '/manageads') ;
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(child: AdsManager(widget.products,widget._add,widget._deleteAd)),
    );
  }
}

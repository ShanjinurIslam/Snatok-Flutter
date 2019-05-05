import 'package:flutter/material.dart';

class ManageAd extends StatelessWidget{
  final Function _deleteAd ;

  ManageAd(this._deleteAd) ;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manage Ad'),);
  }
}


import 'package:flutter/material.dart';
import 'ads.dart';
import 'ads_control.dart';


class AdsManager extends StatelessWidget {
  final List<Map<String,dynamic>> products ; 

  AdsManager(this.products) ;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Expanded(child:Ads(products))]);
  }
}

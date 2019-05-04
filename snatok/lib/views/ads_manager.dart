import 'package:flutter/material.dart';
import 'ads.dart';
import 'ads_control.dart';


class AdsManager extends StatelessWidget {
  final List<Map<String,String>> products ; 
  final Function _add ;
  final Function _deleteAd ;

  AdsManager(this.products,this._add,this._deleteAd) ;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[AdsControl(_add), Expanded(child:Ads(products,_deleteAd))]);
  }
}

import 'package:flutter/material.dart';

class AdsControl extends StatelessWidget{
  final Function _add ;

  AdsControl(this._add) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
          onPressed: () {
            _add({'title':'Burger','image':'assets/1.jpg'}) ;
          },
          child: Text('Add'),
        ),
        margin: EdgeInsets.all(10),
      );
  }

}
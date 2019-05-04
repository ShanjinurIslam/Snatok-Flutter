import 'package:flutter/material.dart';

class CreateAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text('Create Ad'),
        RaisedButton(
          child: Text('Save'),
          onPressed: () {
            showModalBottomSheet(context: context,builder: (BuildContext context){
              return Center(child: Text('data'),) ;
            }) ;
          },
        )
      ],
    ));
  }
}

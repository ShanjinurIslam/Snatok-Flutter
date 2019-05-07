import 'package:flutter/material.dart';

class AdTitle extends StatelessWidget {
  final String title ;
  
  AdTitle(this.title) ;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
    );
  }
}

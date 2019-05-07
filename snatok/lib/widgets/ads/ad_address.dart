import 'package:flutter/material.dart';

class AdAddress extends StatelessWidget {
  final String address ;
  AdAddress(this.address) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepOrangeAccent),
      child: Text(
        address,
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}

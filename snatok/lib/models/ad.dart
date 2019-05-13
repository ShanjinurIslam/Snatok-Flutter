import 'package:flutter/material.dart';

class Ad {
  final String title;
  final String description;
  final String location;
  final double price;
  final String image;

  Ad(
      {@required this.title,
      @required this.description,
      @required this.location,
      @required this.price,
      @required this.image});
}

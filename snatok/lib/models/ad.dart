import 'package:flutter/material.dart';

class Ad {
  final String title;
  final String description;
  final String location;
  final double price;
  final String image;
  bool isFavorite;

  Ad(
      {this.isFavorite = false,
      @required this.title,
      @required this.description,
      @required this.location,
      @required this.price,
      @required this.image});
}

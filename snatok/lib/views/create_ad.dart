import 'package:flutter/material.dart';

class CreateAd extends StatefulWidget {
  final Function _add;

  CreateAd(this._add);

  @override
  State<StatefulWidget> createState() {
    return _CreateAdState();
  }
}

class _CreateAdState extends State<CreateAd> {
  String title = "default";
  String description = "default";
  String location = "default";
  double price = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: <Widget>[
        Container(
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Title'),
            maxLines: 1,
            onChanged: (String value) {
              setState(() {
                title = value;
              });
            },
          ),
          margin: EdgeInsets.all(20),
        ),
        Container(
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 2,
            onChanged: (String value) {
              setState(() {
                description = value;
              });
            },
          ),
          margin: EdgeInsets.all(20),
        ),
        Container(
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Location'),
            maxLines: 1,
            onChanged: (String value) {
              setState(() {
                location = value;
              });
            },
          ),
          margin: EdgeInsets.all(20),
        ),
        Container(
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Price'),
            maxLines: 1,
            onChanged: (String value) {
              setState(() {
                price = double.parse(value);
              });
            },
          ),
          margin: EdgeInsets.all(20),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: IconButton(
              color: Colors.red,
              onPressed: () {
                print(description);
                print(title);
                widget._add({
                  'title': title,
                  'description':description,
                  'image': 'assets/1.jpg',
                  'location': location,
                  'price': price
                });
                Navigator.pushReplacementNamed(context, '/home');
              },
              icon: Icon(Icons.add_circle,color: Colors.red,size: 45,)),
        ),
      ],
    ));
  }
}

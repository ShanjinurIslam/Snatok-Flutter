import 'package:flutter/material.dart';

class CreateAd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateAdState();
  }
}

class _CreateAdState extends State<CreateAd> {
  String title = "";
  String description = "";
  String topic = "";
  double price = 0;

  Widget buildTextField(String fieldName,
      {double p,
      TextInputType t = TextInputType.text,
      int maxLine = 1,
      String m = ""}) {
    return Container(
      child: TextField(
        autofocus: true,
        keyboardType: t,
        decoration: InputDecoration(labelText: fieldName),
        maxLines: maxLine,
        onChanged: (String value) {
          setState(() {
            if (m == "")
              p = double.parse(value);
            else
              m = value;
          });
        },
      ),
      margin: EdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: <Widget>[
        buildTextField('title', m: title),
        buildTextField('description', maxLine: 2, m: description),
        buildTextField(
          'location',
          m: topic,
        ),
        buildTextField('price', m: "", p: price, t: TextInputType.number),
        RaisedButton(
          child: Text('Add Product'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Text('data'),
                  );
                });
          },
        )
      ],
    ));
  }
}

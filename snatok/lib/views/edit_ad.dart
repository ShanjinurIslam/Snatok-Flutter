import 'package:flutter/material.dart';
import 'package:snatok/models/ad.dart';

class EditAd extends StatefulWidget {
  final Function _replace;
  final int index;
  final Ad product;

  EditAd(this.product, this._replace, this.index);

  @override
  State<StatefulWidget> createState() {
    return _EditAdState();
  }
}

class _EditAdState extends State<EditAd> {
  String title = "";
  String description = "";
  String location = "";
  double price = 0;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    title = widget.product.title;
    description = widget.product.description;
    location = widget.product.location;
    price = widget.product.price;
  }

  Widget buildTitleTextFormField() {
    return TextFormField(
      autofocus: true,
      initialValue: title,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Title'),
      validator: (String value) {
        if (value.trim().length <= 0) return 'Title is required';
      },
      maxLines: 1,
      onSaved: (String value) {
        title = value;
      },
    );
  }

  Widget buildDescriptionTextFormField() {
    return TextFormField(
      autofocus: true,
      initialValue: description,
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.trim().length <= 0) return 'Description is required';
      },
      decoration: InputDecoration(labelText: 'Description'),
      maxLines: 2,
      onSaved: (String value) {
        description = value;
      },
    );
  }

  Widget buildLocationTextFormField() {
    return TextFormField(
      autofocus: true,
      initialValue: location,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: 'Location'),
      validator: (String value) {
        if (value.trim().length <= 0) return 'Location is required';
      },
      maxLines: 1,
      onSaved: (String value) {
        location = value;
      },
    );
  }

  Widget buildPriceTextFormField() {
    return TextFormField(
      autofocus: true,
      initialValue: price.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Price'),
      validator: (String value) {
        if (value.trim().length <= 0) return 'Price is required';
      },
      maxLines: 1,
      onSaved: (String value) {
        price = double.parse(value);
      },
    );
  }

  void _onSubmit() {
    if (!globalKey.currentState.validate()) return;
    globalKey.currentState.save();
    widget._replace(widget.index, Ad(title: title,description: description,location: location,price: price,image: 'assets/1.jpg'));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Edit Ad'),
          ),
          body: Center(
              child: Form(
                  key: globalKey,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: buildTitleTextFormField(),
                        margin: EdgeInsets.all(20),
                      ),
                      Container(
                        child: buildDescriptionTextFormField(),
                        margin: EdgeInsets.all(20),
                      ),
                      Container(
                        child: buildLocationTextFormField(),
                        margin: EdgeInsets.all(20),
                      ),
                      Container(
                        child: buildPriceTextFormField(),
                        margin: EdgeInsets.all(20),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: IconButton(
                            color: Colors.red,
                            onPressed: _onSubmit,
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.red,
                              size: 45,
                            )),
                      ),
                    ],
                  )))),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}

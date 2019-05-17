import 'package:flutter/material.dart';
import 'package:snatok/models/ad.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/models/ad.dart';
import 'package:snatok/scoped-models/main.dart';

class CreateAd extends StatefulWidget {
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
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget buildTitleTextFormField() {
    return TextFormField(
      autofocus: true,
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

  void _onSubmit(Function addProduct) {
    if (!globalKey.currentState.validate()) return;
    globalKey.currentState.save();
    addProduct(Ad(
        title: title,
        description: description,
        location: location,
        price: price,
        image: 'assets/1.jpg'));
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
            color: Colors.red,
            onPressed: () => _onSubmit(model.addAd),
            icon: Icon(
              Icons.add_circle,
              color: Colors.red,
              size: 45,
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
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
                      margin: EdgeInsets.all(20), child: _buildSubmitButton()),
                ],
              ))),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}

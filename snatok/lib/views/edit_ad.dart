import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/models/ad.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/scoped-models/main.dart';

class EditAd extends StatefulWidget {
  final int index;
  EditAd(this.index);

  @override
  State<StatefulWidget> createState() {
    return _EditAdState(index);
  }
}

class _EditAdState extends State<EditAd> {
  final int index;
  String title = "";
  String description = "";
  String location = "";
  double price = 0;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  _EditAdState(this.index);

  @override
  void initState() {
    super.initState();
  }

  Widget buildTitleTextFormField(MainModel model) {
    return TextFormField(
      autofocus: true,
      initialValue: model.products[index].title,
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

  Widget buildDescriptionTextFormField(MainModel model) {
    return TextFormField(
      autofocus: true,
      initialValue: model.products[index].description,
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

  Widget buildLocationTextFormField(MainModel model) {
    return TextFormField(
      autofocus: true,
      initialValue: model.products[index].location,
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

  Widget buildPriceTextFormField(MainModel model) {
    return TextFormField(
      autofocus: true,
      initialValue: model.products[index].price.toString(),
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

  void _onSubmit(MainModel model) {
    if (!globalKey.currentState.validate()) return;
    globalKey.currentState.save();
    model.replaceAd(
        index,
        Ad(
            title: title,
            description: description,
            location: location,
            price: price,
            image: 'assets/1.jpg'));
  }

  Widget getForm() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Form(
            key: globalKey,
            child: ListView(
              children: <Widget>[
                Container(
                  child: buildTitleTextFormField(model),
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  child: buildDescriptionTextFormField(model),
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  child: buildLocationTextFormField(model),
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  child: buildPriceTextFormField(model),
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: IconButton(
                      color: Colors.red,
                      onPressed: () => _onSubmit(model),
                      icon: Icon(
                        Icons.add_circle,
                        color: Colors.red,
                        size: 45,
                      )),
                ),
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Edit Ad'),
          ),
          body: Center(
            child: getForm(),
          )),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}

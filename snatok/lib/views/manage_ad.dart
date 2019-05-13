import 'package:flutter/material.dart';

class ManageAd extends StatefulWidget{
  final Function _deleteAd;
  final List<Map<String, dynamic>> products;

  ManageAd(this.products, this._deleteAd);

  @override
  State<StatefulWidget> createState() {
    return _ManageAdState();
  }

  
}

class _ManageAdState extends State<ManageAd> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text(widget.products[index]['title']),
          trailing: ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed('/edit_ad/'+index.toString()) ;
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget._deleteAd(index);
                },
              )
            ],
          ),
        );
      },
      itemCount: widget.products.length,
    );
  }
}

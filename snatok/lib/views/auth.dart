import 'package:flutter/material.dart';

class AuthPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'স্নাতক',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FractionallySizedBox(
              child: TextField(
                decoration: InputDecoration(hintText: 'Username'),
                onChanged: (String value) {},
              ),
              widthFactor: 0.75,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FractionallySizedBox(
              child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (String value) {},
              ),
              widthFactor: 0.75,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                color: Colors.green,
              )
            ],
          ),
        ],
      ),
    );
  }
}

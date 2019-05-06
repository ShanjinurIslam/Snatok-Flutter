import 'package:flutter/material.dart';

class AuthPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPageView> {
  String username;
  String password;
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'স্নাতক',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FractionallySizedBox(
              child: TextField(
                decoration: InputDecoration(hintText: 'Username'),
                onChanged: (String value) {},
              ),
              widthFactor: 0.85,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: FractionallySizedBox(
              child: TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (String value) {},
              ),
              widthFactor: 0.85,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(25,0,25,0),
            child: SwitchListTile(
              value: acceptTerms,
              onChanged: (bool value) {
                setState(() {
                  acceptTerms = value;
                });
              },
              title: Text('Remember me?'),
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

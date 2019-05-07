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

  DecorationImage _buildBackGroundImage() {
    return DecorationImage(
        colorFilter:
            ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
        fit: BoxFit.cover,
        image: AssetImage('assets/2.jpg'));
  }

  Widget _buildUsernameWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      child: FractionallySizedBox(
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: 'Username',
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.grey)),
          onChanged: (String value) {
            setState(() {
              username = value;
            });
          },
        ),
        widthFactor: 0.85,
      ),
    );
  }

  Widget _buildPasswordWidget() {
    return Container(
      margin: EdgeInsets.all(10),
      child: FractionallySizedBox(
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: 'Password',
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.grey)),
          onChanged: (String value) {
            setState(() {
              password = value;
            });
          },
        ),
        widthFactor: 0.85,
      ),
    );
  }

  Widget _buildSwitch() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: SwitchListTile(
        value: acceptTerms,
        onChanged: (bool value) {
          setState(() {
            acceptTerms = value;
          });
        },
        title: Text('Remember me?'),
      ),
    );
  }

  void _logIn() {
    print(username);
    print(password);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(child:Container(
            decoration: BoxDecoration(image: _buildBackGroundImage()),
            child: Center(
              child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                      child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'স্নাতক',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  _buildUsernameWidget(),
                  _buildPasswordWidget(),
                  _buildSwitch(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                        border: Border.all(color: Colors.white)),
                    child: FlatButton(
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: _logIn,
                      color: Colors.green,
                    ),
                  ),
                ],
              ))),
            )),onTap: (){
              FocusScope.of(context).requestFocus(FocusNode()) ;
            },));
  }
}

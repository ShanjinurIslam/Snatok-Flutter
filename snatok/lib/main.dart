import 'package:flutter/material.dart';
import 'views/auth.dart';
import 'views/homepage.dart';
import 'views/ad_management.dart';
import 'views/ad.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String,String>> products = [] ;

  void initState() {
    super.initState();
  }

  void _add(Map<String,String> product) {
    setState(() {
      products.add(product);
    });
  }

  void _deleteAd(int index) {
    setState(() {
      products.removeAt(index) ;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (BuildContext context)=> AuthPageView(),
        '/home':         (BuildContext context) => new HomePage(products,_add,_deleteAd),
        '/manageads':         (BuildContext context) => new AdManagement(),
      },
      theme: ThemeData(primarySwatch: Colors.green,brightness: Brightness.dark),
      onGenerateRoute: (RouteSettings settings){
        final List<String> elements = settings.name.split('/');
        
        if(elements[1]=='ad'){
          final int index = int.parse(elements[2]) ;
          return MaterialPageRoute<bool>(builder: (BuildContext context) => SingleAd(products[index]['image'],products[index]['title']));
        }

        return null ;
        
      },
    );
  }
}
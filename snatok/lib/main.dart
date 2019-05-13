import 'package:flutter/material.dart';
import 'package:snatok/views/edit_ad.dart';
import 'views/auth.dart';
import 'views/edit_ad.dart';
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
  List<Map<String,dynamic>> products = [] ;

  void initState() {
    super.initState();
  }

  void _add(Map<String,dynamic> product) {
    setState(() {
      products.add(product);
    });
  }

  void _deleteAd(int index) {
    setState(() {
      products.removeAt(index) ;
    });
  }

  void _replaceAd(int index,Map<String,dynamic> product){
    setState(() {
      products.removeAt(index) ;
      products.insert(index, product) ;
    }); 
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (BuildContext context)=> AuthPageView(),
        '/home':         (BuildContext context) => new HomePage(products),
        '/manageads':         (BuildContext context) => new AdManagement(_add,_deleteAd,products),
      },
      theme: ThemeData(primarySwatch: Colors.green,brightness: Brightness.light,accentColor: Colors.redAccent),
      onGenerateRoute: (RouteSettings settings){
        final List<String> elements = settings.name.split('/');
        
        if(elements[1]=='ad'){
          final int index = int.parse(elements[2]) ;
          return MaterialPageRoute<bool>(builder: (BuildContext context) => SingleAd(products[index]));
        }

        if(elements[1]=='edit_ad'){
          final int index = int.parse(elements[2]) ;
          return MaterialPageRoute<bool>(builder: (BuildContext context) => EditAd(products[index],_replaceAd,index));
        }

        return null ;
        
      },
    );
  }
}
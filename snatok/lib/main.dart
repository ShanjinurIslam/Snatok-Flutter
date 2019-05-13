import 'package:flutter/material.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/views/edit_ad.dart';
import 'views/auth.dart';
import 'views/edit_ad.dart';
import 'views/homepage.dart';
import 'views/ad_management.dart';
import 'views/ad.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AdModel>(
        model: AdModel(),
        child: MaterialApp(
          routes: {
            '/': (BuildContext context) => AuthPageView(),
            '/home': (BuildContext context) => new HomePage(),
            '/manageads': (BuildContext context) => new AdManagement(),
          },
          theme: ThemeData(
              primarySwatch: Colors.green,
              brightness: Brightness.light,
              accentColor: Colors.redAccent),
          onGenerateRoute: (RouteSettings settings) {
            final List<String> elements = settings.name.split('/');

            if (elements[1] == 'ad') {
              final int index = int.parse(elements[2]);
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => SingleAd(null));
            }

            if (elements[1] == 'edit_ad') {
              final int index = int.parse(elements[2]);
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => EditAd(null, null, null));
            }

            return null;
          },
        ));
  }
}

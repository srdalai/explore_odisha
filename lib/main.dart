import 'package:expolre_odisha/pages/attractions_page.dart';
import 'package:expolre_odisha/pages/city_selector.dart';
import 'package:expolre_odisha/pages/dinners_page.dart';
import 'package:expolre_odisha/pages/home_page.dart';
import 'package:expolre_odisha/pages/hotels_page.dart';
import 'package:expolre_odisha/pages/notifications_page.dart';
import 'package:expolre_odisha/pages/settings_page.dart';
import 'package:expolre_odisha/pages/travels_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.

  //routes
  final routes = <String, WidgetBuilder> {
    "home_page" : (BuildContext context) => HomePage(),
    "attractions_page" : (BuildContext context) => AttractionsPage(),
    "dinners_page" : (BuildContext context) => DinnersPage(),
    "hotels_page" : (BuildContext context) => HotelsPage(),
    "travels_page" : (BuildContext context) => TravelsPage(),
    "settings_page" : (BuildContext context) => SettingsPage(),
    "notifications_page" : (BuildContext context) => NotificationsPage()
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
      routes: routes,
    );
  }
}
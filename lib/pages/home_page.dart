import 'package:expolre_odisha/pages/city_selector.dart';
import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NewAppBar(context, titleTxt: 'Home',),
      drawer: NewDrwaer(context, s1: true,),
      body: CitySelector(),
    );
  }
}
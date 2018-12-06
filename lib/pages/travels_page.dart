import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';

class TravelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NewAppBar(context, titleTxt: 'Travels',),
      drawer: NewDrwaer(context, s5: true,)
    );
  }
}
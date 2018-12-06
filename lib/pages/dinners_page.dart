import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';

class DinnersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NewAppBar(context, titleTxt: 'Dinners',),
      drawer: NewDrwaer(context, s4: true,),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            categories()
          ]
        ),
      )
    );
  }

  Widget categories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(children: <Widget>[
                CircleAvatar(child: Icon(Icons.ac_unit),)
              ],
            )
          ],
        )
      ],
    );
  }
}
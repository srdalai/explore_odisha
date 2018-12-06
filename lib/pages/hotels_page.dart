import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';

class HotelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NewAppBar(context, titleTxt: 'Hotels',),
      drawer: NewDrwaer(context, s3: true,)
    );
  }
}
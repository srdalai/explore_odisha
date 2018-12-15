import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => new _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: NewAppBar(
          context,
          titleTxt: 'Notifications',
        ),
        body: new Center(
          child: FlareActor(
            "assets/circular.flr",
            animation: "circular",
            fit: BoxFit.contain,
          ),
        )
      );
  }
}

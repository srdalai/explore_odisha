import 'package:flutter/material.dart';

class NewAppBar extends AppBar implements StatefulWidget {
  NewAppBar(BuildContext context, {String titleTxt})
      : super(title: Text(titleTxt));
}

class NewDrwaer extends Drawer implements StatelessWidget {
  NewDrwaer(BuildContext context,
      {Key key,
      bool isLoggedIn = true,
      bool s1 = false,
      bool s2 = false,
      bool s3 = false,
      bool s4 = false,
      bool s5 = false})
      : super(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: isLoggedIn ? CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/account_pictures/user_4.jpg"),
                ) : CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.help, size: 50.0,),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "home_page");
                },
                selected: s1,
                trailing: s1
                    ? Icon(Icons.chevron_right)
                    : Container(
                        height: 0.0,
                        width: 0.0,
                      ),
              ),
              ListTile(
                leading: Icon(Icons.local_activity),
                title: Text("What to see !"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "attractions_page");
                },
                selected: s2,
                trailing: s2
                    ? Icon(Icons.chevron_right)
                    : Container(
                        height: 0.0,
                        width: 0.0,
                      ),
              ),
              ListTile(
                leading: Icon(Icons.hotel),
                title: Text("Where to Stay !"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "hotels_page");
                },
                selected: s3,
                trailing: s3
                    ? Icon(Icons.chevron_right)
                    : Container(
                        height: 0.0,
                        width: 0.0,
                      ),
              ),
              ListTile(
                leading: Icon(Icons.restaurant),
                title: Text("Where to Eat !"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "dinners_page");
                },
                selected: s4,
                trailing: s4
                    ? Icon(Icons.chevron_right)
                    : Container(
                        height: 0.0,
                        width: 0.0,
                      ),
              ),
              ListTile(
                leading: Icon(Icons.local_taxi),
                title: Text("How to Go !"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "travels_page");
                },
                selected: s5,
                trailing: s5
                    ? Icon(Icons.chevron_right)
                    : Container(
                        height: 0.0,
                        width: 0.0,
                      ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text("Notifications"),
                onTap: () {
                  Navigator.popAndPushNamed(context, "notifications_page");
                },
                trailing: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10.0,
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text("Settings"),
                onTap: () {
                  Navigator.popAndPushNamed(context, "settings_page");
                },
              ),
            ],
          ),
        ));
}

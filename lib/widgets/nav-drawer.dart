import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/JsonParse.dart';

var id;

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child:
                new Image.asset('assets/images/bkbIcon.png', fit: BoxFit.cover),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('ATM Booths'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JsonParse(id = 1)))
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Branches'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JsonParse(id = 2)))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Divisional Offices'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JsonParse(id = 3))),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Regional Offices'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JsonParse(id = 4))),
            },
          ),
        ],
      ),
    );
  }
}

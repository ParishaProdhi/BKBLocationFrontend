import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('ATM Booths'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute()))},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Branches'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Divisional Offices'),
            onTap: () => {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
            )},

          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Regional Offices'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            )},
          ),
        ],
      ),
    );
  }
}
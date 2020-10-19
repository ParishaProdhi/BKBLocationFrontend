import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/JsonParse.dart';
import 'package:flutter_app/widgets/nav-drawer.dart';
import 'package:geolocation/geolocation.dart';
import 'package:flutter_map/flutter_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BKB Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('BKB Location'),
      ),
      body: JsonParse(id = 'all'),
      // body: Center(
      //   child: Text('Side Menu Tutorial'),
      // ),
    );
  }
}

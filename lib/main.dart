import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/nav-drawer.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        title: Text('Side menu'),
      ),
      body: Center(
        child: Text('Side Menu Tutorial'),
      ),
    );

  }
}

//void main() => runApp(FirstRoute());

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            // Within the `FirstRoute` widget
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {

  /**/
  @override
  Widget build(BuildContext context) {

    Future fetchResult() async {
      final response = await http.get('https://807653bdaa61.ngrok.io/type/1');

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        print(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    }

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10,10,10,0),
        height: 220,
        width: double.maxFinite,
        child: RaisedButton(
          onPressed: () {
            fetchResult();
            // Navigate back to first route when tapped.
          },

      ),
      ),
    );
  }
}
